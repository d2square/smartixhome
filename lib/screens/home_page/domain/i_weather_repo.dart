
import 'package:dartz/dartz.dart';
import 'package:smartix/screens/home_page/domain/weather_model.dart';

abstract class IWeatherRepo {
  Future<Either<String, WeatherModel>> fetchWeather(double? lat,double? long);
}