import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: _body(),
    );
  }
}

_body() {
  return ListView(
    itemExtent: 350,
    children: <Widget>[
      _img("assets/images/dog1.jpeg"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.jpg"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.jpg"),
    ],
  );
}

_img(String img) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
  );
}
