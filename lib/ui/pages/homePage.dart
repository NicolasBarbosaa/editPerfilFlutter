import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perfil/ui/CustomWidgets/menuInferior.dart';
import 'package:perfil/ui/pages/Perfil.dart';
import 'package:perfil/ui/pages/telaInicio.dart';

class HomePage extends StatefulWidget {
    final String name;
  final String email;
  const HomePage({super.key,  required this.name, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemSelecionado = 0;
  //afrima que sera passado posteriormente
  late List telas = [];

  //ir para o próximo item
  void nextStation(int posicao) {
    setState(() {
      itemSelecionado = posicao;
    });
  }

//lista de pagina
 
  @override
  void initState() {
    super.initState();
    telas =  [
    TelaInicio(),
    Text('Pedidos'),
    Text("data"),
    Perfil(name: widget.name, email: widget.email)
  ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: telas.elementAt(itemSelecionado),
      ),
      bottomNavigationBar: bottomNavigationBar(itemSelecionado, nextStation),
    );
  }
}
