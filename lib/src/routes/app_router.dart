import 'package:go_router/go_router.dart';
import 'package:netvoz_app/src/features/login/view/login_view.dart';
import 'package:netvoz_app/src/features/register/view/register_view.dart';
import 'package:netvoz_app/src/features/splash/view/splash_view.dart';
import 'package:netvoz_app/src/features/welcome/view/welcome_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const WelcomeView(),
      routes: [
        GoRoute(
          path: 'register',
          name: 'register',
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
          path: 'login',
          name: 'login',
          builder: (context, state) => const LoginView(),
        ),
      ],
    ),
  ],
);
