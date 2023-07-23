import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Forms extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Forms({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> responses = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["respostas"]
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]["texto"].toString()),
        ...responses.map((resp) {
          return Answer(resp["texto"] as String,
              () => quandoResponder(int.parse(resp["pontos"].toString())));
        }).toList()
      ],
    );
  }
}
