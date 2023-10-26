import 'package:flutter/material.dart';
import 'package:jogodepalavras/singleton/appImportantData.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  late int _focus;

  @override
  void initState() {
    _focus = AppImportantData().getFocus();
    super.initState();
  }

  Widget _buildKeyboardButton(String key) {
    return Expanded(
      child: TextButton(
          onPressed: (){_buttonPressed(key);},
          style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 10),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black38),
          child: Text(
            key,
          )),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 12),
            _buildKeyboardButton('Q'),
            SizedBox(width: 6),
            _buildKeyboardButton('W'),
            SizedBox(width: 6),
            _buildKeyboardButton('E'),
            SizedBox(width: 6),
            _buildKeyboardButton('R'),
            SizedBox(width: 6),
            _buildKeyboardButton('T'),
            SizedBox(width: 6),
            _buildKeyboardButton('Y'),
            SizedBox(width: 6),
            _buildKeyboardButton('U'),
            SizedBox(width: 6),
            _buildKeyboardButton('I'),
            SizedBox(width: 6),
            _buildKeyboardButton('O'),
            SizedBox(width: 6),
            _buildKeyboardButton('P'),
            SizedBox(width: 12),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 12),
            _buildKeyboardButton('A'),
            SizedBox(width: 6),
            _buildKeyboardButton('S'),
            SizedBox(width: 6),
            _buildKeyboardButton('D'),
            SizedBox(width: 6),
            _buildKeyboardButton('F'),
            SizedBox(width: 6),
            _buildKeyboardButton('G'),
            SizedBox(width: 6),
            _buildKeyboardButton('H'),
            SizedBox(width: 6),
            _buildKeyboardButton('J'),
            SizedBox(width: 6),
            _buildKeyboardButton('K'),
            SizedBox(width: 6),
            _buildKeyboardButton('L'),
            SizedBox(width: 6),
            _buildKeyboardButton('Ç'),
            SizedBox(width: 6),
            _buildKeyboardButton('⌫'),
            SizedBox(width: 12),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 12),
            _buildKeyboardButton('Z'),
            SizedBox(width: 6),
            _buildKeyboardButton('X'),
            SizedBox(width: 6),
            _buildKeyboardButton('C'),
            SizedBox(width: 6),
            _buildKeyboardButton('V'),
            SizedBox(width: 6),
            _buildKeyboardButton('B'),
            SizedBox(width: 6),
            _buildKeyboardButton('N'),
            SizedBox(width: 6),
            _buildKeyboardButton('M'),
            SizedBox(width: 6),
            _buildKeyboardButton('IR'),
            SizedBox(width: 12),
          ],
        ),
      ],
    );
  }

  void changeLetter(int focus, String key) {
    switch (focus) {
      case 1:
        AppImportantData().setFrstLetterController(key);
      case 2:
        AppImportantData().setScndLetterController(key);
      case 3:
        AppImportantData().setThrdLetterController(key);
      case 4:
        AppImportantData().setFrthLetterController(key);
      case 5:
        AppImportantData().setFifthLetterController(key);
      default:
        print("not on any letter");
    }
  }

  void _buttonPressed(String key) {
    //logic to backspace button
    if (key == '⌫') {
      if (_focus > 0) {
        if (_focus == 5 && AppImportantData().getFifthLetterController().text == "") {
          AppImportantData().setFocus(--_focus);
          _focus = AppImportantData().getFocus();
          changeLetter(_focus, "");
        } else if (_focus == 5 && AppImportantData().getFifthLetterController().text != "") {
          changeLetter(_focus, "");
        } else {
          if (_focus != 1) {
            AppImportantData().setFocus(--_focus);
            _focus = AppImportantData().getFocus();
          }
          changeLetter(_focus, "");
        }
      }

    } else if(key == "IR") {
      String word = (AppImportantData().getFrstLetterController().text +
          AppImportantData().getScndLetterController().text +
          AppImportantData().getThrdLetterController().text +
          AppImportantData().getFrthLetterController().text +
          AppImportantData().getFifthLetterController().text).toLowerCase();
      if(word.length != 5){
        showAlertDialog(context, "Palavra precisa ter cinco letras.");
      } else if (!AppImportantData().accentRemove().contains(word)) {
        showAlertDialog(context, "Palavra não existe no dicionário.");
      } else {
        AppImportantData().setWord(word);
        AppImportantData().compareWords();
        _focus = AppImportantData().getFocus();
      }

    } else {
      if (_focus < 6) {
        changeLetter(_focus, key);
        if (_focus != 5) {
          AppImportantData().setFocus(++_focus);
          _focus = AppImportantData().getFocus();
        }
      }
    }
  }
  void showAlertDialog(BuildContext context, String message) {
    // configura o button
    Widget okButton = TextButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text("OK!"),
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Palavra inválida!"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildKeyboard();
  }
}
