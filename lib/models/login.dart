import 'package:scoped_model/scoped_model.dart';

class LoginModel extends Model {
  bool active = false;
  String user = "";
  String password = "";

  bool validate(String user, String password) =>
      user == this.user && password == this.password;

  void setActive(bool active) {
    this.active = active;
    notifyListeners();
  }

  void setUser(String user) {
    this.user = user;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
