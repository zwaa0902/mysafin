import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../width.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.size,
    required this.child,
  });

  final Size? size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //   child: Container(
        //     color: Colors.amber.withOpacity(0.6),
        //     width: double.infinity,
        //     height: double.infinity,
        //     child: Center(
        //       child: Utils.isAndroid
        //           ? CircularProgressIndicator(
        //               color: Theme.of(context).colorScheme.primary,
        //             )
        //           : CupertinoActivityIndicator(
        //               radius: 15,
        //               color: Theme.of(context).colorScheme.primary,
        //             ),
        //     ),
        //   ),
        // ),
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Utils.isAndroid)
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  )
                else
                  CupertinoActivityIndicator(
                    radius: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                const Width(25.50),
                const Text('Loading...'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
