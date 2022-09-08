import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartix/routes/app_pages.dart';
import 'package:smartix/screens/login_page/domain/i_sign_in_repo.dart';
import 'package:smartix/utils/common.dart';

class LoginController extends GetxController {
  ISignInRepo iSignInRepo;

  LoginController({required this.iSignInRepo});

  bool loginButtonLoader = false;
  bool isError = false;
  User? user;
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passWordIdController = TextEditingController();

  signInWithEmail() async {
    loginButtonLoader = true;
    update();
    var result = await iSignInRepo.signInWithEmail(
        emailIdController.text, passWordIdController.text);
    loginButtonLoader = false;
    update();
    result.fold((error) {
      isError = true;
      Utils.showAlertSnackBar(error);
    }, (r) {
      isError = false;
      user = r;
      Get.offAllNamed(AppRoutes.dashboard);
    });
    update();
  }

  validateEmail() {}
}
