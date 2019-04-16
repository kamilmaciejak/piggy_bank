import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piggy_bank/models/login.dart';
import 'package:piggy_bank/screens/game.dart';
import 'package:piggy_bank/screens/home.dart';
import 'package:piggy_bank/screens/login.dart';
import 'package:piggy_bank/screens/menu.dart';
import 'package:piggy_bank/screens/settings.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  final login = LoginModel();

  //  Timer.periodic(
  //    const Duration(seconds: 5),
  //        (timer) => counter.increment(),
  //  );

  runApp(
    ScopedModel<LoginModel>(
      model: login,
      child: PiggyBank(),
    ),
  );

  // runApp(PiggyBank());
}

class PiggyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piggy Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        GameScreen.routeName: (context) => GameScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
      },
    );
  }
}
