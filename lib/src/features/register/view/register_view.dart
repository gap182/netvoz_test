import 'dart:math';

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

class RegisterView extends HookConsumerWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsPod);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          assets.backgroundGrayLine,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 60.h,
                          child: Image.asset(
                            assets.logo,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "¡${S.of(context).register}!",
                          style: h1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const _RegisterForms(),
                    const SizedBox(
                      height: 150,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final isFormsValid = ref.watch(
                            registerPod.select((value) => value.formIsValid));
                        return PrimaryButtonBack(
                          onPressed: isFormsValid ? () {} : null,
                          height: 45.h,
                          child: Text(
                            S.of(context).createAccount,
                            style: normalText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterForms extends StatelessWidget {
  const _RegisterForms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(registerPod.select((value) => value.names));

            final errorText = name.status == FormzInputStatus.pure
                ? null
                : name.error == NameError.empty
                    ? S.of(context).emptyError
                    : null;
            return CustomTextField(
              label: S.of(context).names,
              labelStyle: normalText,
              errorText: errorText,
              onChanged: (v) => ref.read(registerPod.notifier).changeName(v),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final lastName =
                ref.watch(registerPod.select((value) => value.lastNames));

            final errorText = lastName.status == FormzInputStatus.pure
                ? null
                : lastName.error == NameError.empty
                    ? S.of(context).emptyError
                    : null;
            return CustomTextField(
              label: S.of(context).lastNames,
              labelStyle: normalText,
              errorText: errorText,
              onChanged: (v) =>
                  ref.read(registerPod.notifier).changeLastName(v),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final phone = ref.watch(registerPod.select((value) => value.phone));

            final errorText = phone.status == FormzInputStatus.pure
                ? null
                : phone.error == PhoneError.empty
                    ? S.of(context).emptyError
                    : phone.error == PhoneError.invalid
                        ? S.of(context).phoneInvalid
                        : null;
            return CustomTextField(
              label: S.of(context).cellPhone,
              labelStyle: normalText,
              textInputType: TextInputType.phone,
              errorText: errorText,
              onChanged: (v) => ref.read(registerPod.notifier).changePhone(v),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, _) {
            final email = ref.watch(registerPod.select((value) => value.email));

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
              onChanged: (v) => ref.read(registerPod.notifier).changeEmail(v),
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
                ref.watch(registerPod.select((value) => value.password));
            final visibility =
                ref.watch(registerPod.select((value) => value.showPassword));

            final errorText = password.status == FormzInputStatus.pure
                ? null
                : password.error == PasswordError.empty
                    ? S.of(context).emptyError
                    : password.error == PasswordError.invalid
                        ? S.of(context).passwordInvalid
                        : null;

            final iconVisibility = GestureDetector(
              onTap: () =>
                  ref.read(registerPod.notifier).onChangeVisibilityPassword(),
              child: Icon(
                visibility ? Icons.visibility_off_outlined : Icons.visibility,
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
                  ref.read(registerPod.notifier).changePassword(v),
            );
          },
        ),
      ],
    );
  }
}
