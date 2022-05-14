import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/generated/l10n.dart';
import 'package:netvoz_app/src/core/theme/colors.dart';
import 'package:netvoz_app/src/core/theme/type.dart';
import 'package:netvoz_app/src/dependencies/dependencies.dart';

class WelcomeView extends StatefulHookConsumerWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends ConsumerState<WelcomeView> {
  late TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    tapGestureRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(assetsPod);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            assets.background,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    assets.whiteLogo,
                    width: 100.h,
                    height: 100.h,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    S.of(context).yourShoppingCenter,
                    style: h2.copyWith(color: Colors.white),
                  ),
                  Text(
                    S.of(context).virtual,
                    style: h1.copyWith(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  _LoginButton(
                    leading: Image.asset(assets.logoButton),
                    center: S.of(context).login,
                    onTap: () => context.go("/welcome/login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _LoginButton(
                    leading: Image.asset(assets.google),
                    center: S.of(context).loginGoogle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _LoginButton(
                    leading: Image.asset(assets.facebook),
                    center: S.of(context).loginFacebook,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _LoginButton(
                    leading: Image.asset(assets.apple),
                    center: S.of(context).loginApple,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: S.of(context).imNew,
                      style: normalText.copyWith(color: Colors.white),
                      children: [
                        const TextSpan(text: " "),
                        TextSpan(
                            text: S.of(context).register,
                            style: normalText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: tapGestureRecognizer
                              ..onTap = () {
                                context.go('/welcome/register');
                              }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    S.of(context).loginNoregister,
                    style: normalText.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RichText(
                      text: TextSpan(
                        text: S.of(context).acceptTerms,
                        style: smallText.copyWith(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: S.of(context).termsNetvoz,
                            style: smallText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: S.of(context).privacy,
                            style: smallText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: " y "),
                          TextSpan(
                            text: S.of(context).terms,
                            style: smallText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    this.leading,
    this.center,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final String? center;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 25.h,
                  height: 25.h,
                  child: leading ?? const SizedBox.shrink()),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                center ?? "",
                style: normalText.copyWith(
                  color: UiColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
