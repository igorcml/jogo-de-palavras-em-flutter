import 'package:flutter/material.dart';
import 'package:jogodepalavras/wordPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Palavras',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.brown,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WordPage(title: 'Acerte a palavra secreta'),
    );
  }
}
