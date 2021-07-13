import 'package:flutter/material.dart';
import 'package:for_review/constants.dart';
import 'package:for_review/screens/items_view/widgets/app_icon_button.dart';

class ItemsAppBar extends StatelessWidget {
  const ItemsAppBar({
    Key? key,
    required this.controller,
    required this.onTap,
    this.title = '',
    this.height = 60,
    this.titleColor = kTextColor,
  }) : super(key: key);

  final ScrollController controller;
  final String title;
  final VoidCallback onTap;
  final double height;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kBackgroundColor,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      floating: true,
      flexibleSpace: Align(
        alignment: const Alignment(1, 0),
        child: AppIconButton(
          onTap: onTap,
          icon: Icons.add,
        ),
      ),
      expandedHeight: height,
    );
  }
}
