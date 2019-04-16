import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game';
  static const screenTitle = 'Game';

  void _showGame(BuildContext context) {
    Navigator.pushNamed(context, GameScreen.routeName);
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
            ],
          ),
        ),
      ),
    );
  }
}
