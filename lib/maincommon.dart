import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netvoz_app/src/core/theme/theme.dart';
import 'package:netvoz_app/src/routes/app_router.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Netvoz App',
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        theme: themData,
      ),
    );
  }
}
