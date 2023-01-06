import 'package:flutter/material.dart';

class STokenIconButton extends StatelessWidget {
  const STokenIconButton(
      {super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: icon,
        ));
  }
}
