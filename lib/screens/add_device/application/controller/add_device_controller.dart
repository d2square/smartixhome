import 'package:get/get.dart';

class AddDeviceController extends GetxController {
  bool alert = false;
  bool deviceOn = false;
  bool deviceOff = false;
  bool deviceConnect = false;
  bool deviceDisConnect = false;

  updateSwitchStatus(bool val, String type) {
    if (type == '1') {
      alert = val;
    } else if (type == '2') {
      deviceOn = val;
    } else if (type == '3') {
      deviceOff = val;
    } else if (type == '4') {
      deviceConnect = val;
    } else if (type == '5') {
      deviceDisConnect = val;
    }
    update();
  }
}
