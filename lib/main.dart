import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rckdu/routes.dart';
import 'package:rckdu/services/local_notif.dart';
import 'package:rckdu/services/news.dart';
import 'package:rckdu/theme.dart';

FlutterLocalNotificationsPlugin locNotf = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  LocalNotification.init(locNotf);

  PermissionStatus status = await Permission.notification.request();
  log('Allow notification: $status');

  if (status.isGranted) {
    await initializeService();
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('hr', 'HR'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('hr', 'HR'),
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

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: false,
    ),
  );
}

Future<void> onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  // bring to foreground
  Timer.periodic(const Duration(seconds: 60), (timer) async {
    log('pokrenuto');
    checkForNewNews(locNotf);
  });
}
