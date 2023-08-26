import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto':
          'Olá esse é um aplicativo de teste, espero que sua experiência seja muito boa!',
      'respostas': [
        {'texto': 'Clique aqui para começar!', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem descobriu o Brasil?',
      'respostas': [
        {'texto': 'Anitta', 'pontuacao': 0},
        {'texto': 'Leonardo da Vinci', 'pontuacao': 0},
        {'texto': 'Pedro Alves Xablau', 'pontuacao': 0},
        {'texto': 'Nenhuma das anteriores', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Quanto é 2 x 0 + 1 / 2',
      'respostas': [
        {'texto': '0.5', 'pontuacao': 2},
        {'texto': '1', 'pontuacao': 0},
        {'texto': '2', 'pontuacao': 0},
        {'texto': '0', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o animal mais rapido do mundo?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 0},
        {'texto': 'Rato', 'pontuacao': 0},
        {'texto': 'Leopardo', 'pontuacao': 2},
        {'texto': 'Humano', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o material mais duro da terra?',
      'respostas': [
        {'texto': 'Ouro', 'pontuacao': 0},
        {'texto': 'Titanio', 'pontuacao': 0},
        {'texto': 'Diamante', 'pontuacao': 2},
        {'texto': 'Madeira', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'O que pesa mais? 4 KG de Isopor, 4KG de Chumbo ou 2KG de Diamante?',
      'respostas': [
        {'texto': 'O isopor pesa mais', 'pontuacao': 0},
        {'texto': 'O chumbo pesa a mesma coisa que o Isopor', 'pontuacao': 2},
        {'texto': 'O isopor é mais leve', 'pontuacao': 0},
        {'texto': 'Os três pesam a mesma coisa', 'pontuacao': 0},
      ],
    },
  ];

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
      _perguntaSelecionada = 1;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
