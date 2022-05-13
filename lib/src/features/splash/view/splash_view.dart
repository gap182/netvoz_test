import 'package:flutter/material.dart';
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

    ref.listen<SplashModelState>(splashPod, (prevState, newState) {
      if (newState.splashStatus == SplashStatus.done) {
        context.go('/login');
      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          assets.logo,
          width: 80.h,
          height: 80.h,
        ),
      ),
    );
  }
}
