

import 'package:smartix/routes/app_pages.dart';

enum DeviceType { ac, smartTv, cctv, refridgerator, microwave, light }

extension DeviceTypeExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.ac:
        return 'AC';
      case DeviceType.smartTv:
        return 'Smart TV';
      case DeviceType.cctv:
        return 'CCTV';
      case DeviceType.refridgerator:
        return 'Refridgerator';
      case DeviceType.microwave:
        return 'Microwave';
      case DeviceType.light:
        return 'Light';
      default:
        return 'Unknown';
    }
  }

  String? get icon {
    switch (this) {
      case DeviceType.ac:
        return 'assets/icons/ac.png';
      case DeviceType.smartTv:
        return 'assets/icons/tv.png';
      case DeviceType.cctv:
        return 'assets/icons/cctv.png';
      case DeviceType.refridgerator:
        return 'assets/icons/fridge.png';
      case DeviceType.microwave:
        return 'assets/icons/oven.png';
      case DeviceType.light:
        return 'assets/icons/light.png';
      default:
        return null;
    }
  }

  String get routeName {
    switch (this) {
      case DeviceType.ac:
        return AppRoutes.acPage;
      case DeviceType.smartTv:
        return AppRoutes.smartTv;
      case DeviceType.cctv:
        return AppRoutes.home;
      case DeviceType.refridgerator:
        return AppRoutes.home;
      case DeviceType.microwave:
        return AppRoutes.home;
      case DeviceType.light:
        return AppRoutes.lightPage;
      default:
        return '/unknown';
    }
  }
}
