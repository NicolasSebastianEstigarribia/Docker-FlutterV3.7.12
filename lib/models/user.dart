

class User {
  final String username;

  const User(
      {required this.username,});


  Map<String, dynamic> toJson() => {
        "username": username
      };
}