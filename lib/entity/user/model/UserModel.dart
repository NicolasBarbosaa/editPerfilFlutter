

class UserModel{
  String name;
  String password;
  String  email;
  String dataNascimento;
  String? image;

  UserModel({
    required this.name,
    required this.password,
    required this.email,
    required this.dataNascimento,
    this.image
  });

  @override
  String toString() {
    return 'name: $name, password: $password, email: $email, data: $dataNascimento, file: $image';
  }
}