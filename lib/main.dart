import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/pages/dashboard.dart';
import 'package:productbox_flutter_exercise/pages/login.dart';
import 'package:productbox_flutter_exercise/pages/userdocument.dart';
import 'package:productbox_flutter_exercise/pages/viewimage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProductBox Flutter Exercise',
      theme: MyThemeData.themeData,
      initialRoute: 'login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'login': (context) => const Loginscreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Userdocument(),
        '/dashboard': (context) => Dashboard(),


      },

    );
  }
}
