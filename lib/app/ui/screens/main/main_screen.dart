import 'package:clean_architecture_with_bloc/app/ui/screens/main/main_screen_view_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.viewModel, super.key});

  final MainScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Screen'),
      ),
    );
  }
}
