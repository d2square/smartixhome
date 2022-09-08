import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';
import 'package:smartix/utils/on_off_button.dart';
import '../../../../utils/enums.dart';


class AcScreen extends StatefulWidget {
  AcScreen({Key? key})
      : assert(Get.arguments.type == DeviceType.ac),
        super(key: key);

  @override
  State<AcScreen> createState() => _AcScreenState();
}

class _AcScreenState extends State<AcScreen> {
  double temp = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0 + MediaQuery
                  .of(context)
                  .padding
                  .top),
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
                        'Air Conditioner',
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'AC',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Text(
                        Get.arguments.room,
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.grey60),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Temperature',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey60),
                      ),
                      Text(
                        '25°C',
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.grey60),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SleekCircularSlider(
                  min: 16,
                  max: 31,
                  initialValue: temp,
                  appearance: CircularSliderAppearance(
                    size: 300.0,
                    customColors: CustomSliderColors(
                      progressBarColor: SmartIxColors.primary,
                      trackColor: SmartIxColors.grey30,
                      dotColor: SmartIxColors.primary,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8.0,
                      trackWidth: 8.0,
                      handlerSize: 16.0,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      temp = double.parse(value.toStringAsFixed(1));
                    });
                  },
                  onChangeStart: (double startValue) {
                    // callback providing a starting value (when a pan gesture starts)
                  },
                  onChangeEnd: (double endValue) {
                    // callback providing an ending value (when a pan gesture ends)
                  },
                  innerWidget: (double value) {
                    //This the widget that will show current value
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "cool",
                            style: Utils.textStyle(
                                fontSize: 14.0, colors: SmartIxColors.grey60),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: temp.floor() <= 16
                                    ? SmartIxColors.grey30
                                    : SmartIxColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: temp.floor() <= 16
                                      ? null
                                      : () {
                                    setState(() {
                                      temp--;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                "${value.toStringAsFixed(1)}°C",
                                style: Utils.textStyle(fontSize: 14.0,
                                    colors: SmartIxColors.grey80),
                              ),
                              const SizedBox(width: 16.0),
                              CircleAvatar(
                                backgroundColor: temp.round() == 31
                                    ? SmartIxColors.grey30
                                    : SmartIxColors.primary,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: temp.round() == 31
                                      ? null
                                      : () {
                                    setState(() {
                                      temp++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 56.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27.5, vertical: 6.5),
                            decoration: BoxDecoration(
                              color: SmartIxColors.grey10,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "Auto Adjust",
                              style: Utils.textStyle(fontSize: 14.0,
                                  colors: SmartIxColors.primary),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: SmartIxColors.secondary10,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.sunny,
                              color: SmartIxColors.primary, size: 32.0),
                          Icon(Icons.water_drop_outlined,
                              color: SmartIxColors.primary, size: 32.0),
                          Icon(Icons.cloud_rounded,
                              color: SmartIxColors.primary, size: 32.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 56.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundColor: SmartIxColors.secondary10,
                              child: Icon(Icons.wb_sunny,
                                  color: SmartIxColors.primary, size: 24.0),
                            ),
                            Text(
                              "Sleep",
                              style: Utils.textStyle(fontSize: 14.0,
                                  colors: SmartIxColors.grey60),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundColor: SmartIxColors.secondary10,
                              child: Icon(Icons.wb_cloudy,
                                  color: SmartIxColors.primary, size: 24.0),
                            ),
                            Text(
                              "Cold",
                              style: Utils.textStyle(fontSize: 14.0,
                                  colors: SmartIxColors.grey60),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundColor: SmartIxColors.secondary10,
                              child: Icon(Icons.refresh,
                                  color: SmartIxColors.primary, size: 24.0),
                            ),
                            Text(
                              "Routine",
                              style: Utils.textStyle(fontSize: 14.0,
                                  colors: SmartIxColors.grey60)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80.0),
              const ChipButton(
                child: Icon(Icons.power_settings_new_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
