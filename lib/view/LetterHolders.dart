import 'package:flutter/material.dart';
import 'package:jogodepalavras/singleton/appImportantData.dart';

class LetterHolders extends StatefulWidget {
  final List<ValueNotifier<int>> counterValueNotifier;

  LetterHolders({super.key, required this.counterValueNotifier});

  @override
  State<LetterHolders> createState() => _LetterHoldersState();
}

class _LetterHoldersState extends State<LetterHolders> {
  late List<ValueNotifier<int>> _counterValueNotifier;

  @override
  void initState() {
    _counterValueNotifier = widget.counterValueNotifier;
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget _buildLetterHolder(
      TextEditingController controller, Color letterHolderColor) {
    return Expanded(
      flex: 2,
      child: TextField(
        readOnly: true,
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: letterHolderColor,
        ),
      ),
    );
  }

  Widget _buildLine(
    TextEditingController frstLetterController,
    TextEditingController scndLetterController,
    TextEditingController thrdLetterController,
    TextEditingController frthLetterController,
    TextEditingController fifthLetterController,
    Color letterHolderColor1,
    Color letterHolderColor2,
    Color letterHolderColor3,
    Color letterHolderColor4,
    Color letterHolderColor5,
  ) {
    return Row(
      children: [
        Spacer(flex: 2),
        _buildLetterHolder(
            frstLetterController, letterHolderColor1),
        Spacer(flex: 1),
        _buildLetterHolder(
            scndLetterController, letterHolderColor2),
        Spacer(flex: 1),
        _buildLetterHolder(
            thrdLetterController, letterHolderColor3),
        Spacer(flex: 1),
        _buildLetterHolder(
            frthLetterController, letterHolderColor4),
        Spacer(flex: 1),
        _buildLetterHolder(
            fifthLetterController, letterHolderColor5),
        Spacer(flex: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        ListenableBuilder(
            listenable: _counterValueNotifier[0],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
                AppImportantData().getLettersController(0, 0),
                AppImportantData().getLettersController(0, 1),
                AppImportantData().getLettersController(0, 2),
                AppImportantData().getLettersController(0, 3),
                AppImportantData().getLettersController(0, 4),
                 _counterValueNotifier[0].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[0].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[0].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[0].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[0].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
        SizedBox(
          height: 24,
        ),
        ListenableBuilder(
            listenable: _counterValueNotifier[1],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
                AppImportantData().getLettersController(1, 0),
                AppImportantData().getLettersController(1, 1),
                AppImportantData().getLettersController(1, 2),
                AppImportantData().getLettersController(1, 3),
                AppImportantData().getLettersController(1, 4),
                _counterValueNotifier[1].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[1].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[1].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[1].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[1].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
        SizedBox(
          height: 24,
        ),
        ListenableBuilder(
            listenable: _counterValueNotifier[2],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
                AppImportantData().getLettersController(2, 0),
                AppImportantData().getLettersController(2, 1),
                AppImportantData().getLettersController(2, 2),
                AppImportantData().getLettersController(2, 3),
                AppImportantData().getLettersController(2, 4),
                _counterValueNotifier[2].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[2].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[2].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[2].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[2].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
        SizedBox(
          height: 24,
        ),
        ListenableBuilder(
            listenable: _counterValueNotifier[3],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
                AppImportantData().getLettersController(3, 0),
                AppImportantData().getLettersController(3, 1),
                AppImportantData().getLettersController(3, 2),
                AppImportantData().getLettersController(3, 3),
                AppImportantData().getLettersController(3, 4),
                _counterValueNotifier[3].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[3].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[3].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[3].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[3].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
        SizedBox(
          height: 24,
        ),
        ListenableBuilder(
            listenable: _counterValueNotifier[4],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
                AppImportantData().getLettersController(4, 0),
                AppImportantData().getLettersController(4, 1),
                AppImportantData().getLettersController(4, 2),
                AppImportantData().getLettersController(4, 3),
                AppImportantData().getLettersController(4, 4),
                _counterValueNotifier[4].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[4].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[4].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[4].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[4].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
        SizedBox(
          height: 24,
        ),
        ListenableBuilder(
            listenable: _counterValueNotifier[5],
            builder: (BuildContext context, Widget? child) {
              return _buildLine(
               AppImportantData().getLettersController(5, 0),
               AppImportantData().getLettersController(5, 1),
               AppImportantData().getLettersController(5, 2),
               AppImportantData().getLettersController(5, 3),
               AppImportantData().getLettersController(5, 4),
                _counterValueNotifier[5].value == 2
                    ? AppImportantData().letterHolderColors[0]
                    : Colors.black26,
                _counterValueNotifier[5].value == 2
                    ? AppImportantData().letterHolderColors[1]
                    : Colors.black26,
                _counterValueNotifier[5].value == 2
                    ? AppImportantData().letterHolderColors[2]
                    : Colors.black26,
                _counterValueNotifier[5].value == 2
                    ? AppImportantData().letterHolderColors[3]
                    : Colors.black26,
                _counterValueNotifier[5].value == 2
                    ? AppImportantData().letterHolderColors[4]
                    : Colors.black26,
              );
            }),
      ],
    );
  }
}
