import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<T> useMemoizedFuture<T>(Future<T> Function() create) {
  final future = useMemoized(create, const []);
  return useFuture(future);
}
