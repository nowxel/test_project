import 'package:flutter/material.dart';
import 'package:flutter_router_example/views/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Login()));
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}