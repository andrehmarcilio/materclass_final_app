import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.child,
      this.icon,
      this.backGroundColor = Colors.white});

  final Widget child;
  final Widget? icon;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(8.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: icon,
                )
              : const SizedBox.shrink(),
          child
        ],
      ),
    );
  }
}
