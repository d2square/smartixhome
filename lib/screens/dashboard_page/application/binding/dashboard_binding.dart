import 'package:smartix/screens/dashboard_page/application/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class DashBoardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController(),permanent: true);
  }
}
