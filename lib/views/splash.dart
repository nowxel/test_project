import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'onboarding_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _firstLaunch = (prefs.getBool('firstLaunch') ?? false);
    bool _hasUser = prefs.getBool('hasUser') ?? false;

    if (_firstLaunch) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => const Login()));
    } else if (_firstLaunch && _hasUser) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => Home()));
    } else {
      await prefs.setBool('firstLaunch', true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => const OnBoardingPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}
