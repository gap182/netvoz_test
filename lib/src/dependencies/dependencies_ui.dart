part of 'dependencies.dart';

final splashPod = StateNotifierProvider<SplashNotifier, SplashModelState>(
  (ref) => SplashNotifier(),
);
