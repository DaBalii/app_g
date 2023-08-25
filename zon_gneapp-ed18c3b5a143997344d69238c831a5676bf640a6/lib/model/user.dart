class User {

  String name;

  String prenom;

  String email;

  String tel;

  String password;


  User({
    required this.name,
    required this.prenom,
    required this.email,
    required this.tel,
    required this.password,
  });

  factory User.fromMap(dynamic map) {
    return User(name: map['name'],
        prenom: map['prenom'],
        email: map['email'],
        tel: map['tel'],
        password: map['password']
    );
  }

}

