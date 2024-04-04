import 'package:flutter/material.dart';
import 'package:perfil/ui/pages/Login.dart';
void  main() => runApp(MyApp());

class MyApp extends MaterialApp{
   MyApp({super.key}) : super(home: Login(), debugShowCheckedModeBanner: false );
}