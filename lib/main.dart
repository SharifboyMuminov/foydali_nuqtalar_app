import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foydali_nuqtalar/app/app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}
