import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartix/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartix/screens/login_page/application/controller/login_controller.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(builder: (loginController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/login_home.jpeg',
                      height: getProportionateScreenHeight(250.0),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: loginController.emailIdController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        hintText: 'Email',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    obscureText: true,
                    controller: loginController.passWordIdController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        suffixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                loginController.loginButtonLoader == true
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            if (!GetUtils.isEmail(
                                loginController.emailIdController.text)) {
                              Utils.showAlertSnackBar(
                                  "Please enter valid email id");
                            } else if (loginController
                                .emailIdController.text.isEmpty) {
                              Utils.showAlertSnackBar("Please enter email id");
                            } else if (loginController
                                .passWordIdController.text.isEmpty) {
                              Utils.showAlertSnackBar("Please enter password");
                            } else {
                              loginController.signInWithEmail();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: SmartIxColors.primary,
                              borderRadius: BorderRadius.circular(70.0),
                            ),
                            child: Text(
                              'Get Started',
                              style: Utils.textStyle(
                                  fontSize: 14.0,
                                  colors: SmartIxColors.tertiary),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
              ],
            );
          }),
        ),
      ),
    );
  }
}
