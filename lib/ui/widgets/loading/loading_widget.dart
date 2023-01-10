import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.size,
  });

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? double.infinity,
      height: size?.height ?? 100,
      child: Center(
        child: Utils.isAndroid
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              )
            : CupertinoActivityIndicator(
                radius: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
      ),
    );
  }
}
