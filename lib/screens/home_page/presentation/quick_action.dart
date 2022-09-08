import 'package:flutter/material.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';

class QuickAction extends StatelessWidget {
  final String action;

  const QuickAction({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: SmartIxColors.primary,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sunny, size: 24.0, color: SmartIxColors.tertiary),
              const SizedBox(width: 4.0),
              Text(
                action,
                style: Utils.textStyle(
                    fontSize: 14.0, colors: SmartIxColors.tertiary),
              )
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            '6:00 AM',
            style: Utils.textStyle(
                fontSize: 14.0, colors: SmartIxColors.tertiary80),
          ),
          const SizedBox(height: 4.0),
          Text(
            '5 Devices',
            style: Utils.textStyle(
                fontSize: 14.0, colors: SmartIxColors.tertiary80),
          )
        ],
      ),
    );
  }
}
