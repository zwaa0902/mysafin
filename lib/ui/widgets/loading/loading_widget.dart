import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.size,
  });

  final Size? size;
  static Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? double.infinity,
      height: size?.height ?? 100,
      child: Center(
        child: Utils.isAndroid
            ? CircularProgressIndicator(
                color: color,
              )
            : CupertinoActivityIndicator(
                radius: 15,
                color: color,
              ),
      ),
    );
  }
}
