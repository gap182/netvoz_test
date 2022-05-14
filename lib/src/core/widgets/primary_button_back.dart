import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netvoz_app/src/core/widgets/primary_button.dart';

import '../theme/colors.dart';

class PrimaryButtonBack extends StatelessWidget {
  const PrimaryButtonBack({
    Key? key,
    this.height,
    this.child,
    this.onPressed,
  }) : super(key: key);

  final double? height;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: UiColors.primaryColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: PrimaryButton(
            height: height,
            onPressed: onPressed,
            child: child,
          ),
        ),
      ],
    );
  }
}
