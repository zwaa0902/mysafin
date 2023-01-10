import 'package:flutter/material.dart';

import '../../../../config/theme.dart';
import '../../card/card_transfer/card_transfer_widget.dart';
import '../../loading/loading_widget.dart';

class AvatarCardList extends StatelessWidget {
  const AvatarCardList({super.key, required this.sendMoneyList});
  final List<String> sendMoneyList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: sendMoneyList.length + 1,
      itemBuilder: itemBuilder,
    );
  }

  Widget itemBuild(BuildContext context, int index) {
    if (index < sendMoneyList.length) {
      final String name = sendMoneyList[index];
      return Container(
          padding: const EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
          ),
          child: CardTransferWidget(
            name: name,
          ));
    } else if (index == sendMoneyList.length) {
      return Container(
        height: 52,
        width: 52,
        color: AppColor.primary400,
        padding: const EdgeInsets.all(16),
        child: const Icon(
          Icons.add,
          size: 24,
        ),
      );
    }

    return Container(
      color: Colors.red,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (sendMoneyList.isEmpty) {
      // return const LoadingWidget();
      return const SizedBox();
    } else {
      if (sendMoneyList.isEmpty) {
        return const SizedBox();
      } else {
        return itemBuild(context, index);
      }
    }
  }
}
