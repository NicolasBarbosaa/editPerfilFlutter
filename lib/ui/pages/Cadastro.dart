import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:perfil/entity/user/controller/cadastroController.dart';
import 'package:perfil/entity/user/model/UserModel.dart';
import 'package:perfil/ui/pages/Login.dart';

import '../../entity/user/database/UserDataBase.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _LoginState();
}

class _LoginState extends State<Cadastro> {
  File? _selectImage;
  String? _imageUrl;

  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  final emailController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final imageController = TextEditingController();

  @override
  void initState() {
    dataNascimentoController.text =
        // DateFormat('dd-MM-yyyy').format(DateTime.now())
        '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('Logo.png')),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 35, 44),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 220,
              width: 220,
              child: _selectImage != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(_selectImage!),
                    )
                  : _imageUrl != null
                      ? CircleAvatar(
                          foregroundColor: Colors.black,
                          backgroundImage: NetworkImage(_imageUrl!),
                        )
                      : CircleAvatar(backgroundImage: NetworkImage('assets/cadastro.png')),
                          
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Color.fromARGB(255, 255, 255, 255),
              child: const Text(
                'Escolher imagem da galeria',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () async {
                await _pickImageFromGallery();
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                  hintText: 'Usuário', border: OutlineInputBorder()),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller:
                    dataNascimentoController, //editing controller of this TextField
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.calendar_today),
                    iconColor: Colors.black,
                    alignLabelWithHint: true, 
                    labelText:
                        'Selecione sua data de nascimento: ' 
                    ),
                readOnly:
                    true, 
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1900), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2040));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    if (CadastroController.calcularIdade(pickedDate) >= 18) {
                      setState(() {
                        dataNascimentoController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Apenas maiores de 18')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Nenhuma data selecionada')),
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (nomeController.text.isNotEmpty &&
                      senhaController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      dataNascimentoController.text.isNotEmpty) {
                    if (UserDataBase.users
                        .any((user) => user.email == emailController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Email de usuário já está em uso'),
                        ),
                      );
                    } else {
                      if (EmailValidator.validate(emailController.text)) {
                        UserModel userModel = UserModel(
                            name: nomeController.text,
                            password: senhaController.text,
                            email: emailController.text,
                            dataNascimento: dataNascimentoController.text,
                            image: _selectImage);
                        CadastroController.addUser(userModel);
              
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Login(
                                      newUser: UserModel(
                                    name: nomeController.text,
                                    password: senhaController.text,
                                    email: emailController.text,
                                    dataNascimento: dataNascimentoController.text,
                                  ))),
                          (route) => false,
                        );
              
                        // Mostrar mensagem de sucesso
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Cadastro realizado com sucesso'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Email inválido'),
                          ),
                        );
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Preencha todos os campos"),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                            width: 1.0, color: Color.fromARGB(255, 0, 0, 0)))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const Text('Cadastrar'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    setState(() {
      _selectImage = File(pickedImage.path);
      print(_selectImage);
      print(_imageUrl);
      if (kIsWeb) {
        _selectImage = null; // Clear local file reference if running on web
        _imageUrl = pickedImage.path; // Store the web image URL
      }
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImag =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImag == null) return;

    setState(() {
      _selectImage = File(returnedImag.path);
    });
  }
}
