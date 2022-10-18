import 'package:chaika_test/generated/l10n.dart';
import 'package:chaika_test/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  mainNavigation =  MainNavigation();
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: mainNavigation.routes,
            onGenerateRoute: mainNavigation.onGenerateRoute,
            initialRoute: MainNavigationRouteNames.transactionDetailScreen,
          );
        });
  }
}
