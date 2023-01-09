import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme.dart';
import '../../../data/models/menu_item.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/height.dart';
import '../../widgets/width.dart';

class MenuItems {
  static const SfMenuItem dashboard = SfMenuItem('Dashboard');
  static const SfMenuItem profile = SfMenuItem('Profile');
  static const SfMenuItem transactions = SfMenuItem('Transactions');
  static const SfMenuItem settings = SfMenuItem('Settings');
  static const SfMenuItem help = SfMenuItem('Help');
  static const List<SfMenuItem> all = <SfMenuItem>[
    dashboard,
    profile,
    transactions,
    settings,
    help,
  ];
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
    required this.currentItem,
    required this.onSelectedItem,
  });

  final SfMenuItem currentItem;
  final ValueChanged<SfMenuItem> onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/female_avatar.svg',
                    width: 44,
                    height: 44,
                  ),
                  const Width(12),
                  Text(
                    'Carol Black',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(fontWeightDelta: 2),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ...MenuItems.all
                .map((SfMenuItem item) => buildMenuItem(context, item))
                .toList(),
            const Spacer(
              flex: 2,
            ),
            Container(
              width: 125,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SfButton(
                title: 'Logout',
                type: BtnType.plain,
                icon: SvgPicture.asset('assets/icons/logout.svg'),
                onTap: () {},
                size: BtnSize.large,
              ),
            ),
            const Height(40),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context,
    SfMenuItem item,
  ) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            border: Border(
          left: currentItem == item
              ? const BorderSide(width: 5, color: AppColor.primary500)
              : BorderSide.none,
        )),
        child: ListTile(
          title: Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontWeightDelta: currentItem == item ? 5 : 2),
          ),
          onTap: () {},
        ),
      );
}
