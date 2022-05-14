import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/generated/l10n.dart';
import 'package:netvoz_app/src/core/theme/type.dart';
import 'package:netvoz_app/src/core/widgets/custom_textfield.dart';
import 'package:netvoz_app/src/core/widgets/primary_button_back.dart';
import 'package:netvoz_app/src/dependencies/dependencies.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsPod);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            assets.backgroundGrayLine,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                  PrimaryButtonBack(
                    onPressed: () {},
                    height: 45.h,
                    child: Text(
                      S.of(context).createAccount,
                      style: normalText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
        CustomTextField(
          label: S.of(context).names,
          labelStyle: normalText,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          label: S.of(context).lastNames,
          labelStyle: normalText,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          label: S.of(context).cellPhone,
          labelStyle: normalText,
          textInputType: TextInputType.phone,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          label: S.of(context).email,
          labelStyle: normalText,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
