import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/theme.dart';

class SfToastMessages {
  Widget build({
    required BuildContext context,
    ToastMessageSize size = ToastMessageSize.medium,
    ToastMessageState state = ToastMessageState.info,
    bool darkMode = false,
    required String text,
  }) {
    final iconSize = size == ToastMessageSize.medium ? 22.0 : 18.0;
    final space = size == ToastMessageSize.medium ? 10.0 : 7.0;
    final textStyle = size == ToastMessageSize.medium
        ? Theme.of(context).textTheme.bodyMedium?.apply(
              color: _textColors[state],
            )
        : Theme.of(context).textTheme.bodyMedium?.apply(
              color: _textColors[state],
            );
    final icon = _icons[state];
    final color = _colors[state];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon!,
          SizedBox(width: space),
          Expanded(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }

  void show({
    required BuildContext context,
    ToastMessageSize size = ToastMessageSize.medium,
    ToastMessageState state = ToastMessageState.info,
    required String text,
    Duration duration = const Duration(seconds: 2),
  }) {
    _fToast.init(context);
    _fToast.showToast(
      child: SfToastMessages().build(
        size: size,
        state: state,
        text: text,
        context: context,
      ),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 50.0,
          left: 16.0,
          right: 16.0,
          child: child,
        );
      },
      toastDuration: duration,
    );
  }

  // Privates
  late final _colors = {
    ToastMessageState.success: AppColor.success400,
    ToastMessageState.warning: AppColor.warning800,
    ToastMessageState.error: AppColor.error700,
    ToastMessageState.info: AppColor.noti600,
  };
  late final _icons = {
    ToastMessageState.success:
        SvgPicture.asset('assets/icons/check_circle.svg'),
    ToastMessageState.warning: SvgPicture.asset('assets/icons/warning.svg'),
    ToastMessageState.error: SvgPicture.asset('assets/icons/error.svg'),
    ToastMessageState.info: SvgPicture.asset('assets/icons/info.svg'),
  };
  late final _textColors = {
    ToastMessageState.success: AppColor.neutral0,
    ToastMessageState.warning: AppColor.neutral0,
    ToastMessageState.error: AppColor.neutral0,
    ToastMessageState.info: AppColor.neutral0,
  };
  final FToast _fToast = FToast();
}

enum ToastMessageSize { medium, small }

enum ToastMessageState { success, warning, error, info }
