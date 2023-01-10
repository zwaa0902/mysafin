import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../config/theme.dart';
import '../../../cubit/menu/menu_cubit.dart';
import '../../../data/models/menu_item.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/height.dart';
import '../../widgets/width.dart';

class MenuItems {
  static const SfMenuItem dashboard = SfMenuItem('Dashboard');
  static const SfMenuItem profile = SfMenuItem('Profile');
  static const SfMenuItem transactions = SfMenuItem('Transactions');
  static const SfMenuItem settings = SfMenuItem('Settings');
  // static const SfMenuItem help = SfMenuItem('Help');
  static const List<SfMenuItem> all = <SfMenuItem>[
    dashboard,
    profile,
    transactions,
    settings,
    // help,
  ];
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

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
            const Height(30),
            // const Spacer(),
            BlocBuilder<MenuCubit, MenuState>(
              builder: (BuildContext context, MenuState state) {
                return Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: MenuItems.all.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildMenuItemWidget(context, index, state.sfMenuItem),
                  ),
                );
              },
            ),
            // const Spacer(
            //   flex: 1,
            // ),
            Container(
              width: 125,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SfButton(
                title: 'Logout',
                type: BtnType.plain,
                icon: SvgPicture.asset('assets/icons/logout.svg'),
                onTap: () {
                  Navigator.of(context).pop();
                },
                size: BtnSize.large,
              ),
            ),
            const Height(40),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItemWidget(
    BuildContext context,
    int index,
    SfMenuItem currentItem,
  ) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border(
            left: (currentItem == MenuItems.all[index])
                ? const BorderSide(width: 5, color: AppColor.primary500)
                : BorderSide.none,
          ),
        ),
        child: ListTile(
          title: Text(
            MenuItems.all[index].title,
            style: Theme.of(context).textTheme.titleMedium!.apply(
                fontWeightDelta: currentItem == MenuItems.all[index] ? 5 : 2),
          ),
          onTap: () {
            context
                .read<MenuCubit>()
                .updateMenuItem(MenuState(sfMenuItem: MenuItems.all[index]));
            ZoomDrawer.of(context)!.close();
          },
          // onSelectedItem(MenuItems.all[index]),
        ),
      );

  // Widget buildMenuItem(
  //   BuildContext context,
  //   SfMenuItem item,
  // ) =>
  //     Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 8),
  //       decoration: BoxDecoration(
  //           border: Border(
  //         left: currentItem == item
  //             ? const BorderSide(width: 5, color: AppColor.primary500)
  //             : BorderSide.none,
  //       )),
  //       child: ListTile(
  //         title: Text(
  //           item.title,
  //           style: Theme.of(context)
  //               .textTheme
  //               .titleMedium!
  //               .apply(fontWeightDelta: currentItem == item ? 5 : 2),
  //         ),
  //         onTap: () => onSelectedItem(item),
  //       ),
  //     );
}
