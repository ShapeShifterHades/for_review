import 'package:flutter/material.dart';
import 'package:for_review/constants.dart';
import 'package:for_review/models/item.dart';
import 'package:for_review/screens/items_view/widgets/app_icon_button.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  final VoidCallback onTap;
  final Item item;
  const ItemTile({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.fitWidth,
              placeholder: kTransparentImage,
              image: item.url,
            ),
          ),
        ),
        Align(
            alignment: const Alignment(0.1, .8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: kBackgroundColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                '${item.name} ',
                style: const TextStyle(color: kTextColor),
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            child: AppIconButton(onTap: onTap, icon: Icons.delete_rounded))
      ],
    );
  }
}
