import 'package:exemplo41/nomesCadastrados.dart';
import 'package:exemplo41/paginicio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  //fazendo a inicializacao do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //acho q estamos falando qual a cor padrao do APP... no caso AZUl
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const inicio(),
        '/nomesCad': (_) => const nomesCad(),
      },

      //home: inicio(),
    );
  }
}
