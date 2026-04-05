import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/di/di.dart';
import 'core/l10n/translations/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/shared_prefs_utils.dart';

void main() async {
  initDependencies();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  var isLoggedIn =
      (await getIt<SharedPrefsUtils>().getToken())?.isNotEmpty ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taswqly",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.navigationRoute,
    );
  }
}
