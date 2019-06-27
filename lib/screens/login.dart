import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/data/shared_preferences.dart';
import 'package:piggy_bank/screens/menu.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';
import 'package:piggy_bank/screens/widgets/login_text_field.dart';
import 'package:piggy_bank/screens/widgets/methods.dart';
import 'package:piggy_bank/screens/widgets/validators.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  static const screenTitle = 'Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode _userFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _userFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<bool> validate(String user, String password) async =>
      getSharedPreferences().then((sharedPreferences) =>
          user == sharedPreferences.getString(prefUser) &&
          password == sharedPreferences.getString(prefPassword));

  void _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      validate(_userController.text, _passwordController.text).then((valid) {
        if (valid) {
          Navigator.pushReplacementNamed(context, MenuScreen.routeName);
        } else {
          showSnackBar(context, 'Invalid user or password');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LoginScreen.screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Welcome', style: Theme.of(context).textTheme.display1),
                SizedBox(height: 24),
                LoginTextField(
                  validator: validateUser,
                  onSaved: (context, user) => {},
                  onFieldSubmitted: (user) => changeFocus(
                        context,
                        _userFocusNode,
                        _passwordFocusNode,
                      ),
                  hintText: 'User',
                  controller: _userController,
                  textInputAction: TextInputAction.next,
                  focusNode: _userFocusNode,
                  autofocus: true,
                ),
                SizedBox(height: 12),
                LoginTextField(
                  validator: validatePassword,
                  onSaved: (context, password) => {},
                  hintText: 'Password',
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                ),
                SizedBox(height: 24),
                CustomRaisedButton(
                  onPressed: _login,
                  text: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
