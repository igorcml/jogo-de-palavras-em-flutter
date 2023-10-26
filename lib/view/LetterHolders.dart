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
                _counterValueNotifier[0].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[0].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[0].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[0].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[0].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
                _counterValueNotifier[1].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[1].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[1].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[1].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[1].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
                _counterValueNotifier[2].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[2].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[2].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[2].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[2].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
                _counterValueNotifier[3].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[3].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[3].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[3].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[3].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
                _counterValueNotifier[4].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[4].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[4].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[4].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[4].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
                _counterValueNotifier[5].value == 1
                    ? AppImportantData().getFrstLetterController()
                    : TextEditingController(),
                _counterValueNotifier[5].value == 1
                    ? AppImportantData().getScndLetterController()
                    : TextEditingController(),
                _counterValueNotifier[5].value == 1
                    ? AppImportantData().getThrdLetterController()
                    : TextEditingController(),
                _counterValueNotifier[5].value == 1
                    ? AppImportantData().getFrthLetterController()
                    : TextEditingController(),
                _counterValueNotifier[5].value == 1
                    ? AppImportantData().getFifthLetterController()
                    : TextEditingController(),
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
