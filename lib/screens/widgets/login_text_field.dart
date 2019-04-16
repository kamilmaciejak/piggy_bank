import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/callbacks.dart';

class LoginTextField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final SavedCallback onSaved;
  final ValueChanged<String> onFieldSubmitted;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final int maxLength;

  LoginTextField({
    Key key,
    @required this.validator,
    @required this.onSaved,
    this.onFieldSubmitted,
    @required this.hintText,
    @required this.controller,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.obscureText = false,
    this.autofocus = false,
    this.enabled = true,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: (value) => onSaved(context, value),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      obscureText: obscureText,
      autofocus: autofocus,
      enabled: enabled,
      maxLength: maxLength,
    );
  }
}
