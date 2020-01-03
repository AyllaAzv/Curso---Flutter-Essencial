import 'package:base/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Container(
    child: Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => _onClickVoltar(context),
        color: Colors.red,
      ),
    ),
  );
}

_onClickVoltar(context) {
  Navigator.pop(context, "Tela 3");
}
