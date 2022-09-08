import 'package:flutter/material.dart';
import 'package:smartix/utils/colors.dart';
import 'package:smartix/utils/common.dart';
import '../widgets/routine_tile.dart';

class RoutineHomeScreen extends StatelessWidget {
  const RoutineHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text("Add")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0 + MediaQuery.of(context).padding.top),
              Row(
                children: [

                  Expanded(
                    child: Center(
                      child: Text(
                        'Routine',
                        style: Utils.textStyle(
                            fontSize: 14.0, colors: SmartIxColors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36.0),
              Text(
                'Active Routines',
                style:
                    Utils.textStyle(fontSize: 14.0, colors: SmartIxColors.grey),
              ),
              const SizedBox(height: 16.0),
              const RoutineTile(name: 'Wake up', active: true),
              const SizedBox(height: 24.0),
              const RoutineTile(name: 'Clean', active: true),
              const SizedBox(height: 24.0),
              const RoutineTile(name: 'Laundry'),
              const SizedBox(height: 24.0),
              const RoutineTile(name: 'Work'),
              const SizedBox(height: 24.0),
              const RoutineTile(name: 'Sleep'),
              const SizedBox(height: 24.0),
              const RoutineTile(name: 'Gym'),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
