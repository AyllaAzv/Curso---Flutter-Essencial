import 'package:base/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
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
      ),
    ),
  );
}

_onClickVoltar(context) {
  Navigator.pop(context, "Tela 2");
}
