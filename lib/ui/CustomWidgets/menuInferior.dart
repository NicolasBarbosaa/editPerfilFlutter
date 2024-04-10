import 'package:flutter/material.dart';

//função que retorna um bottomNavigationBar
BottomNavigationBar bottomNavigationBar(int itemSelecionado, nextStation) {
  return BottomNavigationBar(
    currentIndex: itemSelecionado,
    onTap: nextStation,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    items: [
      bottomNavigationBarItem(Icons.home, 'home'),
      bottomNavigationBarItem(Icons.search, 'Busca'),
      bottomNavigationBarItem(Icons.shopping_cart, 'Pedidos'),
      bottomNavigationBarItem(Icons.person, 'Perfil'),
    ],
  );
}

//função que retorna um bottomNavigationBarItem
BottomNavigationBarItem bottomNavigationBarItem(IconData icon, String texto) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      color: Colors.black,
    ),
    label: texto,
  );
}