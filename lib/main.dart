import 'package:clean_architecture_with_bloc/app/imdb_clone_app.dart';
import 'package:clean_architecture_with_bloc/core/di/di_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await initDi();

  runApp(const IMDBCloneApp());
}
