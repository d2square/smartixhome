import 'package:smartix/networking/provider/api.dart';
import 'package:smartix/screens/home_page/application/controllers/home_controller.dart';
import 'package:smartix/screens/home_page/domain/i_weather_repo.dart';
import 'package:smartix/screens/home_page/domain/weather_api_repository.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<IWeatherRepo>(
        () => WeatherApiRepository(apiClient: Get.find()));
    Get.put(HomeController(iWeatherRepo: Get.find()),permanent: true);
  }
}
