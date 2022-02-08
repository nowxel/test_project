import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('email', 'useremail@gmail.com');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Home()));
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}