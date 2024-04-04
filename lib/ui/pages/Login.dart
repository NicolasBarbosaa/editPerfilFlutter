import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  File?   _selectImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.black,
            child: const Text(
              'Pegar a imagem com galeria',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () => {
              _pickImageFromGallery()
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.black,
            child: const Text(
              'Pegar a imagem com a camêra',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () => {
              _pickImageFromCamera()
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 600,
            width: 600,
            child: _selectImage != null
                ? kIsWeb
                    ? Image.network(_selectImage!.path)
                    : Image.file(_selectImage!)
                : Text('Please select an image'),
          )
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);


    if (returnedImage == null) return;

    setState(() {
      if (kIsWeb) {
        _selectImage = File(returnedImage.path);print(_selectImage);
        Image.network(returnedImage.path);
      } else {
        _selectImage = File(returnedImage.path);
       
      }
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImag = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImag == null) return;

    setState(() {
      _selectImage = File(returnedImag.path);
    });
  }
}

//    Future<Uint8List?> pickImageFromGallery() async {
//     ImagePicker picker = ImagePicker();

//       XFile? file = await picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 90);

//     if (file != null) return await file.readAsBytes();
//     return null;
       

//   }
// }