class SignUp{
  String name;
  String email;
  String phoneNumber;
  String password;

  SignUp({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber
  });

  SignUp.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        name = json['name'],
        phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
    'name' : name,
    'phoneNumber': phoneNumber
  };
}