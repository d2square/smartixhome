import 'package:smartix/screens/add_device/application/binding/add_device_binding.dart';
import 'package:smartix/screens/add_device/presentation/add_device_page.dart';
import 'package:smartix/screens/dashboard_page/application/binding/dashboard_binding.dart';
import 'package:smartix/screens/dashboard_page/presentation/dashbord_page.dart';
import 'package:smartix/screens/home_page/application/binding/home_page_binding.dart';
import 'package:smartix/screens/home_page/presentation/home_page.dart';
import 'package:smartix/screens/home_page/presentation/widgets/ac.dart';
import 'package:smartix/screens/home_page/presentation/widgets/light.dart';
import 'package:smartix/screens/home_page/presentation/widgets/tv.dart';
import 'package:smartix/screens/login_page/application/binding/sign_in_binding.dart';
import 'package:smartix/screens/login_page/presentation/login_ui.dart';
import 'package:smartix/screens/routines/presentation/views/routine_home.dart';
import 'package:smartix/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.defaultRoute;
  static final all = [
    GetPage(name: AppRoutes.defaultRoute, page: () => const SplashPage()),
    GetPage(
        name: AppRoutes.signInPage,
        page: () => const SignIn(),
        binding: SignInBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => const Dashboard(),
        bindings: [DashBoardPageBinding(), HomePageBinding()]),
    GetPage(name: AppRoutes.smartTv, page: () => SmartTvScreen()),
    GetPage(name: AppRoutes.lightPage, page: () => LightScreen()),
    GetPage(name: AppRoutes.acPage, page: () => AcScreen()),
    GetPage(name: AppRoutes.addDevice, page: () => const AddDevicePage(),binding: AddDeviceBinding()),
    GetPage(name: AppRoutes.routine, page: () => const RoutineHomeScreen(),binding: AddDeviceBinding()),

  ];
}
