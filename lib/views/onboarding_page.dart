import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var hasUser = prefs.getString('hasUser');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => hasUser == null
                      ? const Login()
                      : Home(),
                  )
              );
          },
          child: const Text('OnBoarding'),
        ),
      ),
    );
  }
}