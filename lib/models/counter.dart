import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
