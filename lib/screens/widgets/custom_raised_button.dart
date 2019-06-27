import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/callbacks.dart';

class CustomRaisedButton extends StatelessWidget {
  final PressedCallback onPressed;
  final String text;
  final bool enabled;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;

  CustomRaisedButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.shape = const RoundedRectangleBorder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: enabled ? () => onPressed(context) : null,
      textColor: Colors.blue,
      shape: shape,
      child: Container(
        padding: padding,
        child: Text(text),
      ),
    );
  }
}
