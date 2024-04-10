import 'dart:io';

class UserModel{
  String name;
  String password;
  String  email;
  String dataNascimento;
  File? image;

  UserModel({
    required this.name,
    required this.password,
    required this.email,
    required this.dataNascimento,
    this.image
  });
}