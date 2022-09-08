import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';
import 'package:smartix/utils/on_off_button.dart';

import '../../../../utils/enums.dart';


class SmartTvScreen extends StatefulWidget {

  SmartTvScreen({Key? key})
      : assert(Get.arguments.type == DeviceType.smartTv),
        super(key: key);

  @override
  State<SmartTvScreen> createState() => _SmartTvScreenState();
}

class _SmartTvScreenState extends State<SmartTvScreen> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Smart TV',
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
                  Text(
                    'Smart TV',
                    style:
                    Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.black),
                  ),
                  Text(
                    'Living Room',
                    style: Utils.textStyle(
                        fontSize: 14.0, colors: SmartIxColors.grey60),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: SmartIxColors.grey10,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/netflix.png', width: 28),
                            const SizedBox(width: 8.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Netflix',
                                  style: Utils.textStyle(
                                      fontSize: 14.0, colors: SmartIxColors.grey),
                                ),
                                Text(
                                  'Deadline 2022/07/20',
                                  style: Utils.textStyle(
                                      fontSize: 14.0, colors: SmartIxColors.grey60),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: SmartIxColors.grey60),
                          ),
                          child: Text(
                            'Open App',
                            style: Utils.textStyle(
                                fontSize: 14.0, colors: SmartIxColors.grey60),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      'TV Shows',
                      style: Utils.textStyle(
                          fontSize: 14.0, colors: SmartIxColors.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: SmartIxColors.primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(children: [
                        Image.asset('assets/images/movie.png'),
                        Visibility(
                          visible: !_isOn,
                          child: Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: SmartIxColors.black,
                                ),
                                child: Text(
                                  'Off',
                                  style: Utils.textStyle(
                                      fontSize: 14.0, colors: SmartIxColors.tertiary),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(height: 21.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Stranger Things',
                                style: Utils.textStyle(
                                    fontSize: 14.0, colors: SmartIxColors.black),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: SmartIxColors.primary,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0)),
                            child: LinearProgressIndicator(
                              color: SmartIxColors.primary,
                              backgroundColor: SmartIxColors.grey10,
                              value: 0.4,
                              minHeight: 8.0,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // height: 40.h,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border:
                                      Border.all(color: SmartIxColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                          Icons.skip_previous_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: Icon(_isOn
                                          ? Icons.pause
                                          : Icons.play_arrow_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(Icons.skip_next_rounded),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // height: 40.h,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border:
                                      Border.all(color: SmartIxColors.grey30),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.volume_up_rounded),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      '72%',
                                      style: Utils.textStyle(
                                          fontSize: 14.0, colors: SmartIxColors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border:
                                      Border.all(color: SmartIxColors.grey30),
                                ),
                                child: const Icon(Icons.chat, size: 18.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 51.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 48.0,
                    width: 48.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: SmartIxColors.grey30),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: SmartIxColors.grey60,
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: 48.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: SmartIxColors.grey30),
                    ),
                    child: Icon(
                      Icons.cast_connected_rounded,
                      color: SmartIxColors.grey60,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 51.0),
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
