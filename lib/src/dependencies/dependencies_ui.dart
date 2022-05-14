part of 'dependencies.dart';

final splashPod = StateNotifierProvider<SplashNotifier, SplashModelState>(
  (ref) => SplashNotifier(),
);

final loginPod = StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

final registerPod =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(),
);
