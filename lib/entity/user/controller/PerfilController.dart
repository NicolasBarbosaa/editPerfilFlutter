import 'package:perfil/entity/user/database/UserDataBase.dart';

class PerfilController {
  static String? retornarFile(String nome) {
    int index = UserDataBase.users
        .indexWhere((element) => element.name.contains(nome));
    print(UserDataBase.users[index]);
    return UserDataBase.users[index].image;
  }
}
