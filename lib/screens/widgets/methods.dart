import 'package:flutter/material.dart';

void changeFocus(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

void showSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
}
