import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() _reiniciarQuestionario;

  Result(this.pontuacao, this._reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabens!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nivel Jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 28))),
        ElevatedButton(
          child: Text("Reiniciar?", style: TextStyle(fontSize: 18)),
          onPressed: _reiniciarQuestionario,
        ),
      ],
    );
  }
}
