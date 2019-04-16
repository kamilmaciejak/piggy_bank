import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';
import 'package:piggy_bank/screens/game.dart';
import 'package:piggy_bank/screens/settings.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';
  static const screenTitle = 'Menu';

  void _showGame(BuildContext context) {
    Navigator.pushNamed(context, GameScreen.routeName);
  }

  void _showSettings(BuildContext context) {
    Navigator.pushNamed(context, SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRaisedButton(
                onPressed: _showGame,
                text: 'Game',
              ),
              SizedBox(height: 8),
              CustomRaisedButton(
                onPressed: _showSettings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
