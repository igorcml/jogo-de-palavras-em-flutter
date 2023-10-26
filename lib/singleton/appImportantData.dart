import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogodepalavras/view/LetterHolders.dart';

class AppImportantData {
  static final AppImportantData _appData = AppImportantData._internal();

  late TextEditingController _frstLetterController;
  late TextEditingController _scndLetterController;
  late TextEditingController _thrdLetterController;
  late TextEditingController _frthLetterController;
  late TextEditingController _fifthLetterController;
  late List<List<TextEditingController>> lettersController;
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
    ValueNotifier<int>(0),
    ValueNotifier<int>(0),
    ValueNotifier<int>(0),
    ValueNotifier<int>(0),
    ValueNotifier<int>(0)
  ];

  factory AppImportantData() {
    return _appData;
  }

  AppImportantData._internal() {
    getAllWords();
    _frstLetterController = TextEditingController();
    _scndLetterController = TextEditingController();
    _thrdLetterController = TextEditingController();
    _frthLetterController = TextEditingController();
    _fifthLetterController = TextEditingController();
    lettersController = [
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()],
      [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()]
    ];
    _focus = 1;
  }

  void setFrstLetterController(String controller) {
    _frstLetterController.text = controller;
  }

  void setScndLetterController(String controller) {
    _scndLetterController.text = controller;
  }

  void setThrdLetterController(String controller) {
    _thrdLetterController.text = controller;
  }

  void setFrthLetterController(String controller) {
    _frthLetterController.text = controller;
  }

  void setFifthLetterController(String controller) {
    _fifthLetterController.text = controller;
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

  TextEditingController getFrstLetterController() {
    return _frstLetterController;
  }

  TextEditingController getScndLetterController() {
    return _scndLetterController;
  }

  TextEditingController getThrdLetterController() {
    return _thrdLetterController;
  }

  TextEditingController getFrthLetterController() {
    return _frthLetterController;
  }

  TextEditingController getFifthLetterController() {
    return _fifthLetterController;
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
    _secretWord = "jarro";
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
    lineSetListener[tryCounter-1].value++;
    print('colorChange[${tryCounter-1}]: ${lineSetListener[tryCounter - 1].value}');
    if(tryCounter < 6) {
      _focus = 1;
      setStartOfLine();
      lineSetListener[tryCounter].value++;
      lettersController[0][0].text = "olá";
      print(' lettersController: $lettersController');
      print('colorChange[${tryCounter}]: ${lineSetListener[tryCounter].value}');
      tryCounter++;
    }
  }
  void setStartOfLine() {
    _frstLetterController.text = "";
    _scndLetterController.text = "";
    _thrdLetterController.text = "";
    _frthLetterController.text = "";
    _fifthLetterController.text = "";
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

  List<String> accentRemove() {
    List<String> str = [];
    var withAccent =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutAccent =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    for (int j = 0; j < _allWords.length; j++) {
      for (int i = 0; i < withAccent.length; i++) {
        str.add(_allWords[j].replaceAll(withAccent[i], withoutAccent[i]));
      }
    }
    return str;
  }
}
