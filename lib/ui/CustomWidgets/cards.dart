import 'package:flutter/material.dart';

Widget listTile(IconData iconLeading, String title, String subtitle) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 44, 71, 81)),
    child: ListTile(
      onTap: () {},
      leading: Icon(iconLeading, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
      ),
    ),
  );
}
