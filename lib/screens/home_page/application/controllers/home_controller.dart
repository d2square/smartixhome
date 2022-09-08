import 'package:geolocator/geolocator.dart';
import 'package:smartix/screens/home_page/domain/i_weather_repo.dart';
import 'package:get/get.dart';
import 'package:smartix/screens/home_page/domain/weather_model.dart';
import 'package:smartix/utils/common.dart';

class HomeController extends GetxController {
  IWeatherRepo iWeatherRepo;

  HomeController({required this.iWeatherRepo});

  bool fetchWeather = false;
  bool isError = false;
  String error = "";
  WeatherModel? weatherData;
  bool switchVal = false;

  updateSwitchValue(bool val) {
    switchVal = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchVehicleTypeList();
  }

  fetchVehicleTypeList() async {
    bool permission = await Utils.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double longitude = position.longitude;
    double latitude = position.latitude;
    fetchWeather = true;
    update();
    var result = await iWeatherRepo.fetchWeather(latitude, longitude);
    fetchWeather = false;
    update();
    result.fold((l) {
      isError = true;
      error = l;
    }, (r) {
      isError = false;
      error = "";
      weatherData = r;
    });
    update();
  }
}
