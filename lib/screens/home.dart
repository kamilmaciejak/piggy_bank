import 'package:flutter/material.dart';
import 'package:piggy_bank/models/login.dart';
import 'package:piggy_bank/screens/login.dart';
import 'package:piggy_bank/screens/menu.dart';
import 'package:piggy_bank/screens/widgets/builders.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  static const screenTitle = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showLogin(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void _showMenu(BuildContext context) {
    Navigator.pushNamed(context, MenuScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomeScreen.screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ScopedModelDescendant<LoginModel>(
            builder: (context, child, login) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildVisibleWidget(
                      CustomRaisedButton(
                        onPressed: _showLogin,
                        text: 'Login',
                      ),
                      login.active,
                    ),
                    buildVisibleWidget(
                      CustomRaisedButton(
                        onPressed: _showMenu,
                        text: 'Menu',
                      ),
                      !login.active,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
