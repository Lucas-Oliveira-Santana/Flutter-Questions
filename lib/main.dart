import 'package:flutter/material.dart';
import 'result.dart';
import 'forms.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": 'Qual é a sua cor favorita?',
      "respostas": [
        {
          "texto": "preto",
          "pontos": 10,
        },
        {
          "texto": "vermelho",
          "pontos": 5,
        },
        {
          "texto": "azul",
          "pontos": 3,
        },
        {
          "texto": "rosa",
          "pontos": 1,
        },
      ]
    },
    {
      "texto": 'Qual é o seu animal favorito?',
      "respostas": [
        {
          "texto": "gato",
          "pontos": 10,
        },
        {
          "texto": "cachorro",
          "pontos": 5,
        },
        {
          "texto": "tigre",
          "pontos": 3,
        },
        {
          "texto": "ave",
          "pontos": 1,
        },
      ]
    },
    {
      "texto": 'Qual seu instrumento favorito?',
      "respostas": [
        {
          "texto": "violao",
          "pontos": 10,
        },
        {
          "texto": "guitarra",
          "pontos": 5,
        },
        {
          "texto": "bateria",
          "pontos": 3,
        },
        {
          "texto": "baixo",
          "pontos": 1,
        },
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets =
    //     responses.map((text) => Answer(text, _responder)).toList();

    // for (String response in responses) {
    //   widgets.add(Answer(response, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Forms(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Result(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
