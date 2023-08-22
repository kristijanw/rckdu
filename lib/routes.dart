import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rckdu/screens/home/home.dart';
import 'package:rckdu/screens/home/preload.dart';
import 'package:rckdu/screens/language/language.dart';
import 'package:rckdu/screens/news/news.dart';
import 'package:rckdu/screens/splash/splash.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/language',
      builder: (BuildContext context, GoRouterState state) {
        return const LanguageScreen();
      },
    ),
    GoRoute(
      path: '/preloadhome',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePreload();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/news',
      builder: (BuildContext context, GoRouterState state) {
        return const NewsScreen();
      },
    ),
  ],
);
