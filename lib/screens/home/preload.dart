import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

final class HomePreload extends HookWidget {
  const HomePreload({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return Timer(
        const Duration(seconds: 5),
        () => context.go('/navigation'),
      ).cancel;
    }, []);

    return Scaffold(
      body: Image.asset(
        context.locale.toString() == 'en_US'
            ? "assets/images/preloadhome_en.png"
            : "assets/images/preloadhome.png",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
