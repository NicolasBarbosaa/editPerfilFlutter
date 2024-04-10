
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:perfil/ui/CustomWidgets/cards.dart';

class Perfil extends StatefulWidget {
  final String name;
  final String email;
  const Perfil({super.key, required this.name, required this.email}) : super();

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 35, 44),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(
              255, 6, 35, 44), 
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        height: 120,
                        child: ClipOval(
                          child:
                              Image.asset('perfilFoto.jpg', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 20), 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.name}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${widget.email}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width: 20), 
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Benefícios',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: listTile(
                  Icons.card_giftcard_rounded,
                  "Mais amigos, mais prêmios",
                  "Ganhe desconto para cada amigo convidado"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: listTile(Icons.percent, 'Cupons',
                  "Verifique seus cupons e adicione novos"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Pessoal',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  listTile(Icons.location_city, "São Paulo", "Alterar Cidade"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: listTile(Icons.loyalty, 'Ingressos',
                  "Todos os seus ingressos comprados são armazenados aqui"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: listTile(Icons.help, 'Ajuda',
                  "Alguma dúvida ou problema? Estamos aqui para ajudar"),
            )
          ],
        ),
      ),
    );
  }
}