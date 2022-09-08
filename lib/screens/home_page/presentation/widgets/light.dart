import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';
import 'package:smartix/utils/grdient_progress.dart';
import 'package:smartix/utils/on_off_button.dart';
import '../../../../utils/enums.dart';

class LightScreen extends StatefulWidget {


  LightScreen({Key? key})
      : assert(Get.arguments.type == DeviceType.light),
        super(key: key);

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.0 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Light',
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Living Room',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Switch.adaptive(
                        value: _isOn,
                        onChanged: (bool v) {
                          setState(() {
                            _isOn = v;
                          });
                        },
                        activeColor: SmartIxColors.primary,
                      )
                    ],
                  ),
                  Text(
                    'Light Intesity',
                    style: Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.grey60),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              if (_isOn)
                Image.asset(
                  'assets/images/light_on.png',
                  width: 159.0,
                )
              else
                Image.asset(
                  'assets/images/light_off.png',
                  width: 75.0,
                ),
              const SizedBox(height: 40.0),
              GradientCircularProgressIndicator(
                radius: 100.0,
                gradientColors: [
                  const Color(0XFFE89D0D),
                  const Color(0XFFFCFBC3),
                  SmartIxColors.primary,
                  SmartIxColors.secondary,
                ],
                strokeWidth: 28.0,
              ),
              const SizedBox(height: 80.0),
              ChipButton(
                child: const Icon(Icons.power_settings_new_rounded),
                onPressed: () {
                  setState(() {
                    _isOn = !_isOn;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
