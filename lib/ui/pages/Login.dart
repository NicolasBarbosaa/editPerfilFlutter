
import 'package:flutter/material.dart';
import 'package:perfil/entity/user/controller/cadastroController.dart';
import 'package:perfil/entity/user/model/UserModel.dart';
import 'package:perfil/ui/pages/Cadastro.dart';
import 'package:perfil/ui/pages/homePage.dart';
import 'package:perfil/ui/widgets/myAppBar.dart';

class Login extends StatefulWidget {
  final UserModel? newUser;

  Login({Key? key, this.newUser}) : super(key: key);

  @override
  _LoginState createState() => _LoginState(newUser: newUser);
}

class _LoginState extends State<Login> {

  final UserModel? newUser;
  final emailController = TextEditingController();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();

  _LoginState({this.newUser});

  @override
  void initState() {
    super.initState();
    if (newUser != null) {
      nomeController.text = newUser!.name;
      senhaController.text = newUser!.password;
      emailController.text = newUser!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Login'),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                hintText: 'Email', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: senhaController,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Senha', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  CadastroController.login(
                      context, nomeController.text, senhaController.text);
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>  HomePage(name: nomeController.text, email: emailController.text, ))
                    );
                },
                child: const Text('Login  '),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Cadastro()),
                  );
                },
                child: const Text('Cadastro  '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}