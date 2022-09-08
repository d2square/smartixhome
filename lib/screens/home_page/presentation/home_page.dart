import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartix/screens/home_page/domain/device_model.dart';
import 'package:smartix/screens/home_page/presentation/devices_page.dart';
import 'package:smartix/screens/home_page/presentation/quick_action.dart';
import 'package:smartix/screens/home_page/presentation/weather_info.dart';
import 'package:smartix/screens/login_page/application/controller/login_controller.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32.0 + MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Good Morning,${loginController.user!.email ?? ""}',
                  style: GoogleFonts.robotoSlab(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.account_circle_sharp),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32.0),
          const WeatherInfo(),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Action',
                style:
                    Utils.textStyle(fontSize: 14.0, colors: SmartIxColors.grey),
              ),
              Text(
                'Edit',
                style: Utils.textStyle(
                    fontSize: 14.0, colors: SmartIxColors.grey80),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...['Wake up', 'Sleep', 'Clean']
                  .map((e) => QuickAction(action: e))
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Active Devices',
            style: Utils.textStyle(
                fontSize: 14.0,
                colors: SmartIxColors.grey,
                weight: FontWeight.w500),
          ),
          const SizedBox(height: 12.0),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            primary: false,
            children: List.generate(
              devices.length,
              (index) {
                return DeviceCard(
                  device: devices[index],
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
        ]),
      ),
    );
  }
}
