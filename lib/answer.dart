import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Answer(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(texto),
        // textColor: Colors.white,
        // color: Colors.blue,
        onPressed: onSelection,
      ),
    );
  }
}
