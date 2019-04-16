import 'package:flutter/material.dart';
import 'package:piggy_bank/models/login.dart';
import 'package:piggy_bank/screens/data/shared_preferences.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';
import 'package:piggy_bank/screens/widgets/login_text_field.dart';
import 'package:piggy_bank/screens/widgets/methods.dart';
import 'package:piggy_bank/screens/widgets/validators.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  static const screenTitle = 'Settings';
  static const textLength = 12;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  var _active = false;
  FocusNode _userFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    getSharedPreferences().then((sharedPreferences) {
      _onActiveChanged(sharedPreferences.getBool(prefActive) ?? false);
      _userController.text = sharedPreferences.getString(prefUser ?? '');
      _passwordController.text = sharedPreferences.getString(prefPassword ?? '');
      _userFocusNode = FocusNode();
      _passwordFocusNode = FocusNode();
    });
    // final login = ScopedModel.of<LoginModel>(context);
    // _onActiveChanged(login.active);
    // _userController.text = login.user;
    // _passwordController.text = login.password;
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _onActiveChanged(bool active) {
    setState(() {
      this._active = active;
    });
  }

  void _onActiveSaved(BuildContext context) {
    setBool(prefActive, _active);
    // ScopedModel.of<LoginModel>(context).setActive(_active);
  }

  void _onUserSaved(BuildContext context, String user) {
    setString(prefUser, user);
    // ScopedModel.of<LoginModel>(context).setUser(user);
  }

  void _onPasswordSaved(BuildContext context, String password) {
    setString(prefPassword, password);
    // ScopedModel.of<LoginModel>(context).setPassword(password);
  }

  void _save(BuildContext context) {
    final form = _formKey.currentState;
    if (!_active) {
      _userController.text = "";
      _passwordController.text = "";
    }
    if (!_active || form.validate()) {
      _onActiveSaved(context);
      form.save();
      showSnackBar(context, 'Saved');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsScreen.screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: ScopedModelDescendant<LoginModel>(
            builder: (context, child, login) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Active login = $_active'),
                  Switch(
                    value: _active,
                    onChanged: (active) => _onActiveChanged(active),
                  ),
                  LoginTextField(
                    validator: validateUser,
                    onSaved: _onUserSaved,
                    onFieldSubmitted: (user) => changeFocus(
                        context, _userFocusNode, _passwordFocusNode
                    ),
                    hintText: 'User',
                    controller: _userController,
                    textInputAction: TextInputAction.next,
                    focusNode: _userFocusNode,
                    enabled: _active,
                    maxLength: SettingsScreen.textLength,
                  ),
                  SizedBox(height: 12),
                  LoginTextField(
                    validator: validatePassword,
                    onSaved: _onPasswordSaved,
                    hintText: 'Password',
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    enabled: _active,
                    maxLength: SettingsScreen.textLength,
                  ),
                  SizedBox(height: 24),
                  CustomRaisedButton(
                    onPressed: _save,
                    text: 'Save',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
