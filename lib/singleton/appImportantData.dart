import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogodepalavras/view/LetterHolders.dart';

class AppImportantData {
  static final AppImportantData _appData = AppImportantData._internal();

  late List<List<TextEditingController>> _lettersController;
  late int _focus;
  late List<String> _allWords;
  late String _secretWord;
  String _word = "";
  int tryCounter = 1;
  List<Color> letterHolderColors = [
    Colors.black26,
    Colors.black26,
    Colors.black26,
    Colors.black26,
    Colors.black26
  ];
  List<ValueNotifier<int>> lineSetListener = [
    ValueNotifier<int>(1),
    ValueNotifier<int>(1),
    ValueNotifier<int>(1),
    ValueNotifier<int>(1),
    ValueNotifier<int>(1),
    ValueNotifier<int>(1)
  ];

  factory AppImportantData() {
    return _appData;
  }

  AppImportantData._internal() {
    getAllWords();
    _lettersController = [
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()]
    ];
    _focus = 1;
  }

  void setLettersController(int line, int letter, String text) {
    _lettersController[line][letter].text = text;
  }

  void setFocus(int focus) {
    _focus = focus;
  }

  void setWord(String word) {
    _word = word;
  }

  void setSecretWord() async {
    await getAllWords();
    Random random = new Random();
    int randomNumber = random.nextInt(_allWords.length);
    _secretWord = _allWords[randomNumber];
    print(_secretWord);
  }

  TextEditingController getLettersController(int line, int letter) {
    return _lettersController[line][letter];
  }

  int getFocus() {
    return _focus;
  }

  String getWord() {
    return _word;
  }

  Future<List<String>> loadAsset() async {
    var text = await rootBundle.loadString('assets/palavras.txt');
    List<String> result = text.split('\n');
    return result;
  }

  getAllWords() async {
    _allWords = await loadAsset();
  }

  void compareWords() {
    List<String> result = [];
    _secretWord = "ruína";
    Map<String, int> secretWordMap = {};
    Map<String, int> wordMap = {};
    _secretWord.split('').forEach((element) {
      secretWordMap[element] =
          secretWordMap.containsKey(element) ? secretWordMap[element]! + 1 : 1;
    });
    print("secretWordMap: $secretWordMap");

    for (int i = 0; i < _word.length; i++) {
      wordMap[_word[i]] =
          wordMap.containsKey(_word[i]) ? wordMap[_word[i]]! + 1 : 1;
      if (!secretWordMap.containsKey(_word[i])) {
        result.add("B");
      } else if (_word[i] == _secretWord[i]) {
        result.add("G");
      } else if (wordMap[_word[i]]! <= secretWordMap[_word[i]]!) {
        result.add("Y");
      } else {
        result.add("B");
      }
    }
    print(_secretWord);
    print(result);
    print(_word);

    setLetterHolderColors(result);
    setFinalWord();
    lineSetListener[tryCounter-1].value++;
    if(tryCounter < 6) {
      _focus = 1;
      tryCounter++;
    }
  }

  void setFinalWord() {
    for (int i = 0; i < 5; i++) {
      _lettersController[tryCounter - 1][i].text = _word[i].toUpperCase();
    }
  }

  void setLetterHolderColors(List<String> newColors) {
    for (int i = 0; i < letterHolderColors.length; i++) {
      switch (newColors[i]) {
        case "B":
          letterHolderColors[i] = Colors.black54;
          break;
        case "Y":
          letterHolderColors[i] = Colors.orange;
          break;
        case "G":
          letterHolderColors[i] = Colors.green;
      }
    }
  }

  int isRepeatedLetter(String word, String letter) {
    int counter = 0;
    for (int i = 0; i < word.length; i++) {
      if (word[i] == letter) {
        counter++;
      }
    }
    return counter;
  }

  String removeAccent(String word) {
    String str = word;
    var withAccent =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutAccent =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
      for (int i = 0; i < withAccent.length; i++) {
        str = str.replaceAll(withAccent[i], withoutAccent[i]);
      }
    return str;
  }

  String checkWord(String word) {
    String test = "";
    String result = "";
    var withAccent =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutAccent =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    for (int j = 0; j < _allWords.length; j++) {
      if(result != "") break;
      for (int i = 0; i < withAccent.length; i++) {
        test = _allWords[j].replaceAll(withAccent[i], withoutAccent[i]);
        if (test == word) {
          result = _allWords[j];
        }
      }
    }
    return result;
  }
}
