import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartix/config/size_config.dart';
import 'package:smartix/screens/add_device/application/controller/add_device_controller.dart';
import 'package:smartix/screens/devices/presentation/widgets/button.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  List<DropdownValueItem> deviceTypeList = [
    const DropdownValueItem(id: '1', description: 'Ac'),
    const DropdownValueItem(id: '2', description: 'Fridge'),
    const DropdownValueItem(id: '3', description: 'Light')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonPrimary(
          label: 'Save Device',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GetBuilder<AddDeviceController>(
            builder: (addDeviceController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Add Device',
                            style: Utils.textStyle(
                                fontSize: 14.0, colors: SmartIxColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        hintText: 'Device Name',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        hintText: 'Description',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        hintText: 'Description',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  dropdownField(
                      label: "Device Type",
                      hintText: 'Select Device type',
                      items: deviceTypeList,
                      isDisabled: false,
                      labelStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      hintTextStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      updateVal: (DropdownValueItem val) {}),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  dropdownField(
                      label: "App Kel",
                      hintText: 'Select App Key',
                      items: [
                        const DropdownValueItem(id: '1', description: 'Default')
                      ],
                      isDisabled: false,
                      labelStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      hintTextStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      updateVal: (DropdownValueItem val) {}),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  dropdownField(
                      label: "Room",
                      hintText: 'Select Room',
                      items: [
                        const DropdownValueItem(
                            id: '1', description: 'Living room'),
                        const DropdownValueItem(id: '2', description: 'Kitchen')
                      ],
                      isDisabled: false,
                      labelStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      hintTextStyle: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                      updateVal: (DropdownValueItem val) {}),
                  SizedBox(height: getProportionateScreenHeight(20.0)),

                  Text('Enable notifications for',
                      style: Utils.textStyle(
                          fontSize: 15.0, colors: SmartIxColors.black,weight: FontWeight.bold)),

                  Row(
                    children: [
                      Text('Alerts',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.black)),
                      Switch(
                        value: addDeviceController.alert,
                        activeColor: SmartIxColors.secondary,
                        inactiveTrackColor: SmartIxColors.grey,
                        onChanged: (bool value) {
                          addDeviceController.updateSwitchStatus(value, '1');
                        },
                      ),
                    ],
                  ),
                  Text('When this device',
                      style: Utils.textStyle(
                          fontSize: 15.0, colors: SmartIxColors.black,weight: FontWeight.bold)),

                  Row(
                    children: [
                      Text('Connect',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Switch(
                        value: addDeviceController.deviceConnect,
                        activeColor: SmartIxColors.secondary,
                        inactiveTrackColor: SmartIxColors.grey,
                        onChanged: (bool value) {
                          addDeviceController.updateSwitchStatus(value,'4');
                        },
                      ),
                      Text('Disconnect',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Switch(
                        value: addDeviceController.deviceDisConnect,
                        activeColor: SmartIxColors.secondary,
                        inactiveTrackColor: SmartIxColors.grey,
                        onChanged: (bool value) {
                          addDeviceController.updateSwitchStatus(value,'5');
                        },
                      ),
                    ],
                  ),

                  Text('When this device turned',
                      style: Utils.textStyle(
                          fontSize: 15.0, colors: SmartIxColors.black,weight: FontWeight.bold)),

                  Row(
                    children: [
                      Text('On',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Switch(
                        value: addDeviceController.deviceOn,
                        activeColor: SmartIxColors.secondary,
                        inactiveTrackColor: SmartIxColors.grey,
                        onChanged: (bool value) {
                          addDeviceController.updateSwitchStatus(value,'2');
                        },
                      ),
                      Text('Off',
                          style: Utils.textStyle(
                              fontSize: 14.0, colors: SmartIxColors.grey)),
                      Switch(
                        value: addDeviceController.deviceOff,
                        activeColor: SmartIxColors.secondary,
                        inactiveTrackColor: SmartIxColors.grey,
                        onChanged: (bool value) {
                          addDeviceController.updateSwitchStatus(value,'3');
                        },
                      ),
                    ],
                  ),

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
