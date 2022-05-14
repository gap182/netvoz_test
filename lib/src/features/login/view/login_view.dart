import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/generated/l10n.dart';
import 'package:netvoz_app/src/core/forms/common_forms.dart';
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

    print('rebuild all');

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
              Consumer(
                builder: (context, ref, _) {
                  final email =
                      ref.watch(loginPod.select((value) => value.email));

                  final errorText = email.status == FormzInputStatus.pure
                      ? null
                      : email.error == EmailError.empty
                          ? S.of(context).emptyError
                          : email.error == EmailError.invalid
                              ? S.of(context).emailInvalid
                              : null;

                  return CustomTextField(
                    label: S.of(context).email,
                    labelStyle: normalText,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (v) =>
                        ref.read(loginPod.notifier).changeEmail(v),
                    errorText: errorText,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final password =
                      ref.watch(loginPod.select((value) => value.password));
                  final visibility =
                      ref.watch(loginPod.select((value) => value.showPassword));

                  final errorText = password.status == FormzInputStatus.pure
                      ? null
                      : password.error == PasswordError.empty
                          ? S.of(context).emptyError
                          : password.error == PasswordError.invalid
                              ? S.of(context).passwordInvalid
                              : null;

                  final iconVisibility = GestureDetector(
                    onTap: () => ref
                        .read(loginPod.notifier)
                        .onChangeVisibilityPassword(),
                    child: Icon(
                      visibility
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: UiColors.primaryColor,
                      size: 30.sp,
                    ),
                  );

                  return CustomTextField(
                    label: S.of(context).password,
                    labelStyle: normalText,
                    errorText: errorText,
                    obscureText: !visibility,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: iconVisibility,
                    ),
                    onChanged: (v) =>
                        ref.read(loginPod.notifier).changePassword(v),
                  );
                },
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
              Consumer(
                builder: (context, ref, child) {
                  final isFormsValid =
                      ref.watch(loginPod.select((value) => value.formIsValid));
                  return PrimaryButtonBack(
                    onPressed: isFormsValid ? () {} : null,
                    height: 45.h,
                    child: Text(
                      S.of(context).continueText,
                      style: normalText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
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
