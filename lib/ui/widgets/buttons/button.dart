import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme.dart';

enum BtnType { contained, outlined, plain }

enum BtnSize { small, medium, large }

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.title,
    this.onTap,
    this.type = BtnType.contained,
    this.width,
    this.margin,
    this.disable = false,
    this.safeArea = false,
    this.size = BtnSize.medium,
    this.isCapitalized = true,
    this.icon,
  });

  final BtnType type;
  final BtnSize size;
  final double? width;
  final bool isCapitalized;
  final String title;
  final VoidCallback? onTap;
  final bool disable;
  final bool safeArea;
  final EdgeInsets? margin;
  final SvgPicture? icon;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final Widget gestureDetector = widget.type == BtnType.plain
        ? TextButton(
            onPressed: widget.onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(48, textButtonSize),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            child: Text(
              widget.title,
              style: style,
            ),
          )
        : GestureDetector(
            onTap: widget.disable ? null : widget.onTap,
            child: Container(
              margin:
                  widget.margin ?? const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(
                vertical: paddingV,
                horizontal: 16,
              ),
              width: widget.width,
              alignment: Alignment.center,
              decoration: decoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.title.isNotEmpty == true)
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style,
                    )
                  else
                    const SizedBox(),
                  SizedBox(
                      width: widget.icon != null
                          ? (widget.title.isNotEmpty == true ? 10 : 0)
                          : 0),
                  widget.icon ?? const SizedBox(),
                ],
              ),
            ),
          );
    if (widget.safeArea) {
      return SafeArea(
        top: false,
        child: gestureDetector,
      );
    }
    return gestureDetector;
  }

  TextStyle get style {
    if (widget.size == BtnSize.small) {
      return Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2);
    } else if (widget.size == BtnSize.large) {
      return Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2);
    }
    return Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: 2);
  }

  double get textButtonSize {
    if (widget.size == BtnSize.small) {
      return 22;
    } else if (widget.size == BtnSize.large) {
      return 24;
    }
    return 24;
  }

  double get paddingV {
    if (widget.size == BtnSize.small) {
      return 8;
    } else if (widget.size == BtnSize.large) {
      return 14;
    }
    return 10;
  }

  double get radius {
    if (widget.size == BtnSize.large) {
      return 12;
    }
    return 8;
  }

  Color get typeColor {
    if (widget.type == BtnType.contained) {
      if (widget.disable) {
        return Theme.of(context).disabledColor;
      }
      return Colors.white;
    } else {
      return Theme.of(context).backgroundColor;
    }
  }

  Decoration decoration() {
    Color color = AppColor.primary400;
    if (widget.type == BtnType.contained) {
      if (widget.disable) {
        color = color.withOpacity(0.5);
        return BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        );
      }
      return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      );
    } else if (widget.type == BtnType.outlined) {
      return BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      return BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      );
    }
  }
}
