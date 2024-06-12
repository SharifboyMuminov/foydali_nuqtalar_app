import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foydali_nuqtalar/app/app.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}
