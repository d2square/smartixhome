import 'package:dartz/dartz.dart';
import 'package:smartix/networking/api_endpoint.dart';
import 'package:smartix/networking/provider/api.dart';
import 'package:smartix/screens/home_page/domain/i_weather_repo.dart';
import 'package:smartix/screens/home_page/domain/weather_model.dart';

class WeatherApiRepository extends IWeatherRepo {
  final ApiClient apiClient;

  WeatherApiRepository({required this.apiClient});

  @override
  Future<Either<String, WeatherModel>> fetchWeather(
      double? lat, double? long) async {
    try {
      var response = await apiClient.get(ApiEndpoint.getWeatherApp +
          '?lat=$lat&lon=$long&appid=439d4b804bc8187953eb36d2a8c26a02');
      if (response!=null) {
        WeatherModel weather = WeatherModel.fromJson(response);
        return right(weather);
      }
      return left("Something went wrong");
    } catch (e) {
      return left(e.toString());
    }
  }
}
