import 'package:flutter/material.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class RoutineTile extends StatelessWidget {
  final String name;
  final bool active;

  const RoutineTile({
    Key? key,
    required this.name,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: active ? SmartIxColors.primary : SmartIxColors.grey10,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sunny,
                size: 24.0,
                color: active ? SmartIxColors.tertiary : SmartIxColors.grey60,
              ),
              const SizedBox(width: 4.0),
              Text(name,
                  style: Utils.textStyle(
                      fontSize: 14.0,
                      colors: active
                          ? SmartIxColors.tertiary
                          : SmartIxColors.grey60)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('6:00 AM',
                  style: Utils.textStyle(
                      fontSize: 14.0,
                      colors: active
                          ? SmartIxColors.tertiary
                          : SmartIxColors.grey60)),
              Text(
                '5 Devices',
                style: Utils.textStyle(
                    fontSize: 14.0,
                    colors: active
                        ? SmartIxColors.tertiary80
                        : SmartIxColors.grey60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
