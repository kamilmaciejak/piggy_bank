import 'package:scoped_model/scoped_model.dart';

class LoginModel extends Model {
  bool active;

  LoginModel(this.active);

  void setActive(bool active) {
    this.active = active;
    notifyListeners();
  }
}
