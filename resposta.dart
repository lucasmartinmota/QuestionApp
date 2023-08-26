import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CupertinoButton(
          color: Colors.black,
          onPressed: quandoSelecionado,
          child: Text(texto),
        ),
      ),
    );
  }
}
