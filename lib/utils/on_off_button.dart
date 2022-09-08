import 'package:flutter/material.dart';
import 'package:smartix/utils/colors.dart';


class ChipButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const ChipButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: SmartIxColors.primary,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
