import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartix/routes/app_pages.dart';
import 'package:smartix/screens/devices/presentation/widgets/button.dart';
import 'package:smartix/screens/home_page/domain/device_model.dart';
import 'package:smartix/screens/home_page/presentation/devices_page.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonPrimary(
          label: 'Add Device',
          onPressed: () {
            Get.toNamed(AppRoutes.addDevice);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back(canPop: true);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Devices',
                    style: Utils.textStyle(
                        fontSize: 14.0,
                        colors: SmartIxColors.black,
                        weight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Living Room',
                style: Utils.textStyle(
                    fontSize: 14.0,
                    colors: SmartIxColors.black,
                    weight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Bed Room',
                style: Utils.textStyle(
                    fontSize: 14.0,
                    colors: SmartIxColors.black,
                    weight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Kitchen',
                style: Utils.textStyle(
                    fontSize: 14.0,
                    colors: SmartIxColors.black,
                    weight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Dining Room',
                style: Utils.textStyle(
                    fontSize: 14.0,
                    colors: SmartIxColors.black,
                    weight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...devices.map((e) => DeviceCard(device: e))],
                ),
              ),
              const SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
