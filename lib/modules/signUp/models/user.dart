class User {
  final String name;
  final String password;

  User({
    required this.name ,
    required this.password
  });

  factory User.fromJson(Map<String , dynamic> json) {
    return User(
      name : json['name'],
      password : json['password'],
    );
  }
}