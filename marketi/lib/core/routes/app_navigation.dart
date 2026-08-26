import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigate(BuildContext context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

void customReplacementNavigate(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customNavigateAndRemoveAllPrevious(BuildContext context, String path){
  GoRouter.of(context).go(path);
}