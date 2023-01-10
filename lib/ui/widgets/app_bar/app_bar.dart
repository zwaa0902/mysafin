import 'package:flutter/material.dart';

import '../menu/menu_widget.dart';
import '../width.dart';

class SfAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SfAppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: menuBar(context),
    );
  }

  Widget menuBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const MenuWidget(),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.apply(fontWeightDelta: 3),
          ),
          const Width(44),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
