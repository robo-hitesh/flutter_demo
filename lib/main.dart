import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/router/routes.dart';
import 'package:flutter_assignment/core/utils/injection.dart';

void main() async {
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Assignment',
      routerConfig: router,
    );
  }
}
