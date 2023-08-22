import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

final class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return Timer(const Duration(seconds: 4), () => context.go('/language'))
          .cancel;
    }, []);

    return Scaffold(
      body: Image.asset(
        "assets/images/splash.gif",
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
