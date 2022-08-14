import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/home/Home_Screen.dart';
import 'package:islami_app/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
        body: provider.isDarkMode()
            ? Image.asset('assets/images/splashScreenDark.png')
            : Image.asset('assets/images/splashScreenLight.png'));
  }
}
