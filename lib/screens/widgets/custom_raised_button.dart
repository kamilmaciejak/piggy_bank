import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/callbacks.dart';

class CustomRaisedButton extends StatelessWidget {
  final PressedCallback onPressed;
  final String text;

  CustomRaisedButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => onPressed(context),
      textColor: Colors.blue,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(text),
      ),
    );
  }
}
