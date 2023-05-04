import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/my_model.dart';


class MyViewModel with ChangeNotifier {
  final MyModel _model = MyModel();

  String get message => _model.message;

  void updateMessage(String newMessage) {
    _model.updateMessage(newMessage);
    notifyListeners();
  }
}
