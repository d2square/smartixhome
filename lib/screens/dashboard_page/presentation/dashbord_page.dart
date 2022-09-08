import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartix/screens/dashboard_page/application/controller/dashboard_controller.dart';
import 'package:smartix/screens/devices/presentation/my_devices.dart';
import 'package:smartix/screens/home_page/presentation/home_page.dart';
import 'package:smartix/screens/routines/presentation/views/routine_home.dart';

class Dashboard extends StatefulWidget {
  final int initialTab;

  const Dashboard({Key? key, this.initialTab = 0}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  DashBoardController controller = Get.find<DashBoardController>();

  final List<Widget> _children = const [
    HomeScreen(),
    DevicesScreen(),
    RoutineHomeScreen(),
  ];

  @override
  void initState() {
    controller.tabController =
        TabController(length: _children.length, vsync: this);
    controller.tabController.index = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (dashboardController) {
      return Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _children,
          controller: dashboardController.tabController,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: dashboardController.onTabTapped,
          currentIndex: dashboardController.tabController.index,
          unselectedFontSize: 14,
          elevation: 2.0,
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_outlined),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone_iphone_rounded),
                activeIcon: Icon(Icons.phone_iphone_rounded),
                label: "Device"),
            BottomNavigationBarItem(
                icon: Icon(Icons.replay_rounded),
                activeIcon: Icon(Icons.replay_rounded),
                label: "Routine"),
          ],
        ),
      );
    });
  }
}
