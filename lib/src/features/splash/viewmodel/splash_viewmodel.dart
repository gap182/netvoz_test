import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/src/features/splash/state/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashModelState> {
  SplashNotifier() : super(SplashModelState());

  void loaded() async {
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(splashStatus: SplashStatus.done);
  }
}
