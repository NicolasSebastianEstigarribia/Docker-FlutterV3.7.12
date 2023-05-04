class MyModel {
  String _message = "Hello World";
  
  String get message => _message;
  
  void updateMessage(String newMessage) {
    _message = newMessage;
  }
}
