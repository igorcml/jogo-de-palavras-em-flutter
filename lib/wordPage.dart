
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogodepalavras/singleton/appImportantData.dart';
import 'dart:math';

import 'package:jogodepalavras/view/Keyboard.dart';
import 'package:jogodepalavras/view/LetterHolders.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key, required this.title});

  final String title;

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  String _word = "";
  int _triesCounter = 1;

  Future<List<String>> loadAsset() async {
    var text = await rootBundle.loadString('assets/palavras.txt');
    List<String> result = text.split('\n');
    return result;
  }

  getWord() async {
    List<String> words = await loadAsset();
    Random random = new Random();
    int randomNumber = random.nextInt(words.length);
    _word =  words[randomNumber];
  }

  @override
  void initState() {
    AppImportantData().setSecretWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          LetterHolders(counterValueNotifier: AppImportantData().lineSetListener),
          Text(
            _word,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Keyboard(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}