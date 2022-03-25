class User{
  String id;
  String name;
  String password;
  String email;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'password' : password,
    'email' : email
  };
}