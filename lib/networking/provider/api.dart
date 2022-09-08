import 'dart:convert';
import 'dart:io';
import 'package:smartix/networking/provider/custom_exception.dart';
import 'package:smartix/networking/provider/dio_client.dart';
import 'package:smartix/utils/common.dart';
import 'package:smartix/utils/pref_user_data.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio httpClient = DioClient().dio;

  ///set common header
  Map<String, String> _setHeaders(Map<String, String> headers) {
    headers["authorization"] = PrefData().getAuthToken();
    return headers;
  }

  ///api get method
  /// url : api url
  /// headers : api header
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    bool hasNet = await Utils.isConnectedToInternet();
    if (!hasNet) {
      throw CustomException(CustomException.ERROR_CONNECTION,
          CustomException.ERROR_NO_INTERNET_CONNECTION);
    }
    Options options = Options(headers: headers);
    try {
      var response = await httpClient.get(url, options: options);
      return _handleResponse(response);
    } on Exception catch (exception) {
      _handleError(exception);
    }
    return null;
  }

  ///api post method
  ///url : api url
  ///headers : api header
  ///body : api body
  ///contentType : contentType can be application/json or application/x-www-form-urlencoded
  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    body,
    String contentType = Headers.formUrlEncodedContentType,
  }) async {
    bool hasNet = await Utils.isConnectedToInternet();
    if (!hasNet) {
      throw CustomException(CustomException.ERROR_CONNECTION,
          CustomException.ERROR_NO_INTERNET_CONNECTION);
    }
    Options options = Options(headers: headers, contentType: contentType);
    var bodyData =
        contentType == Headers.jsonContentType ? json.encode(body) : body;
    try {
      var response = await httpClient.post(
        url,
        options: options,
        data: bodyData,
      );
      return _handleResponse(response);
    } on Exception catch (exception) {
      return _handleError(exception);
    }
  }

  ///api put method
  ///url : api url
  ///headers : api headers
  ///body : api body
  Future<dynamic> put(String url, {Map<String, String>? headers, body}) async {
    bool hasNet = await Utils.isConnectedToInternet();
    if (!hasNet) {
      throw CustomException(CustomException.ERROR_CONNECTION,
          CustomException.ERROR_NO_INTERNET_CONNECTION);
    }
    Options options = Options(headers: headers);
    try {
      var response = await httpClient.put(url, options: options, data: body);
      return _handleResponse(response);
    } on Exception catch (exception) {
      _handleError(exception);
    }
    return null;
  }

  ///api delete method
  ///url : api url
  ///headers : api headers
  ///body : api body
  Future<dynamic> delete(String url,
      {Map<String, String>? headers, body}) async {
    bool hasNet = await Utils.isConnectedToInternet();
    if (!hasNet) {
      throw CustomException(CustomException.ERROR_CONNECTION,
          CustomException.ERROR_NO_INTERNET_CONNECTION);
    }
    Options options = Options(headers: headers);
    try {
      var response = await httpClient.delete(url, options: options, data: body);
      return _handleResponse(response);
    } on Exception catch (exception) {
      _handleError(exception);
    }
    return null;
  }

  Future<dynamic> postMedia(String url,
      {Map<String, String>? headers,
      body,
      Function(double)? uploadProgress}) async {
    bool hasNet = await Utils.isConnectedToInternet();
    if (!hasNet) {
      throw CustomException(CustomException.ERROR_CONNECTION,
          CustomException.ERROR_NO_INTERNET_CONNECTION);
    }
    Options options = Options(
      headers: headers,
    );

    try {
      var response = await httpClient.post(
        url,
        options: options,
        data: body,
        onSendProgress: (int received, int total) {
          if (total != -1) {
            uploadProgress!((received / total * 100));
           }
        },
      );
      return _handleResponse(response);
    } on Exception catch (exception) {
      return _handleError(exception);
    }
  }

  ///here we handle success response
  dynamic _handleResponse(Response? response) {
    final int? statusCode = response?.statusCode;
    final isSuccess = statusCode! >= 200 && statusCode <= 299;

    if (isSuccess) {
      return response?.data;
    } else {
      throw CustomException(statusCode, CustomException.ERROR_CRASH_MSG);
    }
  }

  int counter = 0;

  ///here we handle error response
  dynamic _handleError(Exception? exception) {
    int errorCode = 0;
    String errorMsg = "";
    dynamic errorResponse;
    try {
      if (exception is DioError) {
        errorCode = exception.response?.statusCode ?? 0;
        errorResponse = exception.response?.data ?? exception.toString();

        if (exception.type == DioErrorType.connectTimeout) {
          errorMsg = CustomException.DEFAULT_CONNECT_TIMEOUT_MSG;
        } else if (exception is SocketException) {
          errorMsg = CustomException.DEFAULT_CONNECT_TIMEOUT_MSG;
          errorCode = CustomException.ERROR_CONNECTION;
          errorResponse = errorMsg;
        } else {
          errorMsg = CustomException.ERROR_CRASH_MSG;
          errorCode = CustomException.ERROR_DEFAULT;
        }
      }
    } catch (e) {
      errorMsg = CustomException.ERROR_CRASH_MSG;
      errorCode = CustomException.ERROR_DEFAULT;
      errorResponse = errorMsg;
    }
    throw CustomException(errorCode, errorMsg, errorResponse);
  }
}
