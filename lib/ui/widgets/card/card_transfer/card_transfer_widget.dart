import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme.dart';
import '../../height.dart';

enum Gender { female, male, other }

class CardTransferWidget extends StatelessWidget {
  const CardTransferWidget({
    super.key,
    required this.name,
    this.gender = Gender.male,
    this.color = AppColor.grey60,
  });

  final String name;
  final Color color;
  final Gender gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (gender == Gender.male)
            SvgPicture.asset('assets/icons/male_avatar.svg')
          else if (gender == Gender.female)
            SvgPicture.asset('assets/icons/female_avatar.svg')
          else
            SvgPicture.asset('assets/icons/other_avatar.svg'),
          const Height(20),
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Height(6),
        ],
      ),
    );
  }
}
