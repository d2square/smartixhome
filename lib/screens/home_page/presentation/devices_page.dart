import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartix/screens/home_page/domain/device_model.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';
import 'package:smartix/utils/enums.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  final bool isHomePage;

  const DeviceCard({Key? key, required this.device, this.isHomePage = false})
      : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.device.type!.routeName != '/home-page') {
          Get.toNamed(widget.device.type!.routeName, arguments: widget.device);
        } else {
          Utils.showAlertSnackBar("No route define");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: SmartIxColors.secondary10,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.device.type!.icon ?? 'assets/icons/ac.png',
                  width: 48.0,
                ),
                Transform.scale(
                  scale: 1.0,
                  child: Switch.adaptive(
                    activeColor: SmartIxColors.primary,
                    value: widget.device.active,
                    onChanged: (bool v) {
                      setState(() {
                        widget.device.active = v;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Text(
              widget.device.name ?? widget.device.type!.name,
              style:
                  Utils.textStyle(fontSize: 14.0, colors: SmartIxColors.grey),
            ),
            const SizedBox(height: 4.0),
            Text(
              widget.device.room,
              style:
                  Utils.textStyle(fontSize: 14.0, colors: SmartIxColors.grey60),
            )
          ],
        ),
      ),
    );
  }
}
