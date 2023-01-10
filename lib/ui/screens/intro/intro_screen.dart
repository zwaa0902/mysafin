import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/ui/widgets/height.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/buttons/button.dart';
import '../../../route/router.dart' as route;

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/img/background_intro.png'),
            Positioned(
              left: 140,
              child: SizedBox(
                width: size.width - 140,
                height: size.height,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const SizedBox.shrink(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/stoken_logo.svg',
                                  height: 40,
                                ),
                                const Height(10),
                                Text(
                                  'SToken',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .apply(fontWeightDelta: 2),
                                ),
                                const Height(10),
                                Text(
                                  'Open An Account For Digital E-Wallet Solutions. Instant Payouts.',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const Height(20),
                                Text(
                                  'Join For Free.',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                const Height(50),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SfButton(
                                  margin: EdgeInsets.zero,
                                  title: 'Sign in',
                                  icon: SvgPicture.asset(
                                      'assets/icons/arrow_right.svg'),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      route.loginPage,
                                    );
                                  },
                                ),
                                const Height(20),
                                Text(
                                  'Create an account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(fontWeightDelta: 1),
                                ),
                                const Height(30),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
