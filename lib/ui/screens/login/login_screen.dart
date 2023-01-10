import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/height.dart';
import '../../widgets/loading/loading_widget.dart';
import '../../widgets/textfields/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // AuthBloc authBloc;

  @override
  void initState() {
    // authBloc = BlocProvider.of(context)<AuthBloc>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Utils.hideKeyBoard(context),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // if (state is AuthErrorState) {
            //   // show dialog
            // } else if (state is AuthSuccessState) {
            //   Navigator.pushNamed(context, route.homePage);
            //   SfToastMessages().show(
            //       context: context,
            //       text: 'Đăng nhập thành công',
            //       state: ToastMessageState.success);
            // }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return LoadingWidget(child: loginWidget());
            } else {
              return loginWidget();
            }
          },
        ),
      ),
    );
  }

  Widget loginWidget() {
    final Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (_, BoxConstraints constraint) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/bg.png'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 48),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: SvgPicture.asset(
                            'assets/icons/arrow_left.svg',
                          ),
                        ),
                      ),
                    ),
                    const Height(24),
                    Container(
                      height: size.height * 2 / 3,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const Height(36),
                              Image.asset(
                                'assets/img/safin_logo.png',
                                width: 140,
                              ),
                              const Height(60),
                              SfTextField(
                                controller: usernameController,
                                label: 'Username',
                                onChanged: (String value) {},
                              ),
                              const Height(30),
                              SfTextField(
                                controller: passwordController,
                                label: 'Password',
                                obscureText: true,
                                onChanged: (String value) {},
                              ),
                              const Height(16),
                              Text(
                                'Forgot Password',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                          Column(children: <Widget>[
                            Text(
                              'Don’t have an account yet? Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(fontWeightDelta: 2),
                            ),
                            const Height(20),
                            SizedBox(
                              width: size.width * 2 / 5,
                              child: SfButton(
                                margin: EdgeInsets.zero,
                                title: 'Sign in',
                                icon: SvgPicture.asset(
                                    'assets/icons/arrow_right.svg'),
                                onTap: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    LoginEvent(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Height(20),
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
