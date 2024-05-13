import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/asset/localization/codegen_loader.g.dart';
import '/locator.dart';
import '/routes.dart';
import 'view/splash_view.dart';

import 'constants/app_theme.dart';
import 'core/service/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // env
  //await dotenv.load(fileName: ".env");

  setup();
  runApp(EasyLocalization(
    path: 'lib/asset/localization/translation',
    supportedLocales: const [
      Locale('en'),
      Locale('tr'),
    ],
    assetLoader: const CodegenLoader(),
    fallbackLocale: const Locale('en'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App Theme
    final appTheme = AppTheme();

    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Tic Tac Toe',
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        theme: appTheme.darkTheme,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        home: const SplashView(),
      ),
    );
  }
}
