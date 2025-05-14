import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/router/routes.dart';
import 'package:flutter_assignment/core/utils/app_screen.dart';
import 'package:flutter_assignment/gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  void nextPage() {
    Future.delayed(Duration(seconds: 3), () {
      router.go(AppScreen.loginPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Image.asset(Assets.images.welcome.path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
