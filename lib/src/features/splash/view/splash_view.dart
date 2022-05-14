import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/src/dependencies/dependencies.dart';
import 'package:netvoz_app/src/features/splash/state/splash_state.dart';

class SplashView extends StatefulHookConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(splashPod.notifier).loaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(assetsPod);
    final animationController =
        useAnimationController(duration: const Duration(seconds: 3));
    ref.listen<SplashModelState>(splashPod, (prevState, newState) {
      if (newState.splashStatus == SplashStatus.done) {
        context.go('/welcome');
      }
    });

    animationController.forward();

    final animation = Tween<double>(begin: 0, end: 80.h).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Image.asset(
                assets.logo,
                width: animation.value,
                height: animation.value,
              );
            }),
      ),
    );
  }
}
