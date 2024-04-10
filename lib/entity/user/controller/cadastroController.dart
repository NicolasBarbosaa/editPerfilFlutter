import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfil/entity/user/database/UserDataBase.dart';
import 'package:perfil/entity/user/model/UserModel.dart';
import 'package:perfil/ui/pages/telaInicio.dart';

class CadastroController {
  UserDataBase userDB = UserDataBase();

  

  static addUser(UserModel user) async {
    UserDataBase.users.add(user);
    print(UserDataBase.users);
  }

  static void login(BuildContext context, String nome, String senha) {
    print('chegamos aqui');

    /*uso o iterador para percorrer a lista e verificar se existe o nome passado
  e armazeno o resultado desse iteração na variável resultado*/
    var resultado = UserDataBase.users.indexWhere((item) => item.name == nome);
    print(resultado);

    if (resultado == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('usuario ou Senha invalida'),
        ),
      );
    }

    if (UserDataBase.users[resultado].password == senha) {
      /*o 'pushAndRemoveUtil' serve para colocar o prato de cima embaixo, pq no mobile o sistema que se usa é de empilhamento de pratos
  ent, qnd eu logo, ele volta para pagina logada se tornando a base */
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const TelaInicio()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Senha invalida'),
        ),
      );
    }
  }

  static int calcularIdade(DateTime dataNascimento) {
    DateTime dataAtual = DateTime.now();
    int age = dataAtual.year - dataNascimento.year;
    if (dataNascimento.month > dataAtual.month) {
      age--;
    } else if (dataAtual.month == dataNascimento.month) {
      if (dataNascimento.day > dataAtual.day) {
        age--;
      }
    }
    return age;
  }

  
}
