import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/generated/l10n.dart';
import 'package:netvoz_app/src/core/theme/colors.dart';
import 'package:netvoz_app/src/core/theme/type.dart';
import 'package:netvoz_app/src/core/widgets/custom_textfield.dart';
import 'package:netvoz_app/src/core/widgets/primary_button_back.dart';
import 'package:netvoz_app/src/dependencies/dependencies.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsPod);
    return Scaffold(
      backgroundColor: UiColors.backgroundGray,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                assets.logoName,
                width: 100.h,
                height: 100.h,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                S.of(context).hello,
                style: h1.copyWith(
                  color: UiColors.secondColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                label: S.of(context).email,
                labelStyle: normalText,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: S.of(context).password,
                labelStyle: normalText,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Icon(
                    Icons.visibility_off_outlined,
                    color: UiColors.primaryColor,
                    size: 30.sp,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              RichText(
                text: TextSpan(
                  text: "${S.of(context).ups} ",
                  style: normalText,
                  children: [
                    TextSpan(
                      text: S.of(context).forgotPassword,
                      style: normalText.copyWith(
                        color: UiColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              PrimaryButtonBack(
                onPressed: () {},
                height: 45.h,
                child: Text(
                  S.of(context).continueText,
                  style: normalText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
