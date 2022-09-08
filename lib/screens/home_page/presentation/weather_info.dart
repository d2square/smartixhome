import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartix/screens/home_page/application/controllers/home_controller.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: GetBuilder<HomeController>(
        builder: (homeController) {
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
              color: SmartIxColors.primary,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  Text(
                    'Temperature',
                    style: Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.tertiary),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.thermostat,
                        size: 24,
                        color: SmartIxColors.tertiary,
                      ),
                      Text(homeController.weatherData==null?"":
                        homeController.weatherData!.main!.temp.toString(),
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.tertiary),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Humidity',
                    style: Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.tertiary),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.water_drop_outlined,
                        size: 24,
                        color: SmartIxColors.tertiary,
                      ),
                      Text(homeController.weatherData==null?"":
                        homeController.weatherData!.main!.humidity.toString(),
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.tertiary),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Pressure',
                    style: Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.tertiary),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bolt_sharp,
                        size: 24,
                        color: SmartIxColors.tertiary,
                      ),
                      Text(homeController.weatherData==null?"":
                        homeController.weatherData!.main!.pressure.toString(),
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.tertiary),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          );
        }
      ),
    );
  }
}
