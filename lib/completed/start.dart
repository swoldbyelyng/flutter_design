import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/completed/route_generator.dart';
import 'getting_started/welcome.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'justDrive App',

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        textTheme:
          const TextTheme(headline1: TextStyle(color: Colors.orange))
      ),

    );
  }
}