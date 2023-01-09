import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme.dart';
import '../../height.dart';

class CardCashWidget extends StatelessWidget {
  const CardCashWidget({
    super.key,
    required this.amount,
    required this.title,
    required this.icon,
    this.color = AppColor.teal50,
  });

  final String amount;
  final String title;
  final SvgPicture icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            icon,
            const Height(20),
            Text(
              '$amount VND',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(fontWeightDelta: 2),
            ),
            const Height(12),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Height(6),
          ],
        ),
      ),
    );
  }
}
