import 'package:flutter/material.dart';
import 'package:for_review/constants.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color = kTextColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      color: kPrimaryColor,
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: color,
          )),
    );
  }
}
