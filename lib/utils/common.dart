import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static void showLoadingDialog() {
    Get.generalDialog(
        barrierColor: Colors.white.withOpacity(0.2),
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SizedBox.expand(
              // makes widget fullscreen
              child: Center(
                child: Card(
                    color: Colors.white.withOpacity(.9),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const CupertinoActivityIndicator(),
                    )),
              ),
            ));
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static Future<bool> isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static void dismissLoadingDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void showErrorSnackBar(String? error,
      {bool instantInit = true, String? heading}) {
    Get.snackbar(heading ?? "Error", error!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        instantInit: instantInit,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  static Future<bool> checkPermission() async {
    var permission = await Permission.location.status;

    if (permission.isDenied) {
      permission = await Permission.location.request();
    }

    if (permission.isPermanentlyDenied) {
      showAlertSnackBar("Open Settings and grant permission");
      return false;
    } else if (permission.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  static void showAlertSnackBar(String error, {bool instantInit = true}) {
    Get.snackbar("Alert", error,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow,
        instantInit: instantInit,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  static TextStyle textStyle(
      {double? fontSize, FontWeight? weight, Color? colors}) {
    return GoogleFonts.robotoSlab(
        fontSize: fontSize ?? 16,
        fontWeight: weight ?? FontWeight.w600,
        color: colors ?? Colors.black);
  }

  static void showSucessSnackBar(String? error) {
    Get.snackbar("Success", error!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  static DateTime convertTimeToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  static DateTime convertDateTimeAndAddTime(
      DateTime dateTime, int hours, int minute) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hours, minute);
  }

  static Widget getCircularProgressIndicator() {
    return const SizedBox(
        height: 40,
        width: 40,
        child: Center(child: CircularProgressIndicator()));
  }
}

class DropdownValueItem {
  final String? id;
  final String? description;

  const DropdownValueItem({
    @required this.id,
    @required this.description,
  });

  @override
  bool operator ==(dynamic other) =>
      other != null &&
      other is DropdownValueItem &&
      description == other.description;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

Widget dropdownField({
  String? hintText,
  String? label,
  TextStyle? labelStyle,
  TextStyle? hintTextStyle,
  List<DropdownValueItem>? items,
  bool? isDisabled,
  DropdownValueItem? value,
  @required Function? updateVal,
}) {
  return Container(
    padding: const EdgeInsets.only(
      top: 0,
      bottom: 5.13,
      left: 16,
    ),
    child: Stack(
      children: [
        const Positioned(
          right: 12,
          top: 14,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 7,
          child: Text(
            label!,
            textScaleFactor: 1.0,
            style: const TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 23.87),
          child: DropdownButtonFormField<DropdownValueItem>(
            iconDisabledColor: Colors.transparent,
            validator: (value) =>
                value!.description!.isEmpty ? 'Select Market type' : '',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ).copyWith(color: Colors.grey),
            selectedItemBuilder: (BuildContext context) {
              return items!.map<Widget>((DropdownValueItem item) {
                return Text(
                  item.description!,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ).copyWith(color: Colors.black),
                );
              }).toList();
            },
            iconEnabledColor: Colors.transparent,
            hint: Text(
              hintText!,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ).copyWith(color: Colors.grey),
            ),
            isExpanded: true,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(0),
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            iconSize: 24,
            elevation: 16,
            items: items!.map((DropdownValueItem value) {
              return DropdownMenuItem<DropdownValueItem>(
                value: value,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.description!,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ).copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            value: value,
            onChanged: isDisabled!
                ? null
                : (DropdownValueItem? newValue) {
                    updateVal!(newValue);
                  },
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
      color: isDisabled ? Colors.white : const Color(0xFFF2F2F2),
      border: isDisabled
          ? Border.all(
              width: 1,
              color: Colors.grey,
            )
          : Border.all(
              width: 1,
              color: Colors.transparent,
            ),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
