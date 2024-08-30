import 'package:clean_architecture_with_bloc/app/navigation/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenViewModel {
  void navigateToMainScreen(BuildContext context) {
    context.goNamed(AppRoute.main);
  }
}
