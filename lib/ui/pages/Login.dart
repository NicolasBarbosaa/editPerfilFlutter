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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 35, 44),
        title: Center(child: Image.asset('assets/logo.png')),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'login.png',
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Senha',
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          CadastroController.login(
                              context, nomeController.text, senhaController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => HomePage(
                                    name: nomeController.text,
                                    email: emailController.text,
                                  )));
                        },
                        style: ElevatedButton.styleFrom(
                                foregroundColor: Color.fromARGB(255, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.0,
                                        color: Color.fromARGB(255, 0, 0, 0)))),
                        child: const Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const Cadastro()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Color.fromARGB(255, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        width: 1.0,
                                        color: Color.fromARGB(255, 0, 0, 0)))),
                            child: const Text('Cadastro'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
