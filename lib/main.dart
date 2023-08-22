import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rckdu/routes.dart';
import 'package:rckdu/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('hr', 'HR'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('hr', 'HR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RCKDU',
      theme: theme,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
