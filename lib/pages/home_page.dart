import 'package:base/pages/hello_listview.dart';
import 'package:base/pages/hello_page2.dart';
import 'package:base/pages/hello_page3.dart';
import 'package:base/utils/nav.dart';
import 'package:base/widgets/blue_button.dart';
import 'package:base/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello, Flutter!"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "TAB 1",
              ),
              Tab(
                text: "TAB 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.indigo,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: _onClickFab(),
        ),
        drawer: DrawerList(),
      ),
    );
  }
}

_body(context) {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _text(),
        _pageView(),
        _buttons(),
      ],
    ),
  );
}

_pageView() {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 20),
    height: 300,
    child: PageView(
      children: <Widget>[
        _img("assets/images/dog1.jpeg"),
        _img("assets/images/dog2.png"),
        _img("assets/images/dog3.jpg"),
        _img("assets/images/dog4.png"),
        _img("assets/images/dog5.jpg"),
      ],
    ),
  );
}

_buttons() {
  return Builder(builder: (context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("ListView",
                onPressed: () => _onClickNavigator(context, HelloListView())),
            BlueButton("Page 2",
                onPressed: () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page 3",
                onPressed: () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", onPressed: () => _onClickSnack(context)),
            BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
            BlueButton("Toast", onPressed: _onClickToast),
          ],
        ),
      ],
    );
  });
}

_img(String img) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
  );
}

_text() {
  return Text(
    "Hello, World!",
    style: TextStyle(
      fontSize: 30,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
      decorationStyle: TextDecorationStyle.dashed,
    ),
  );
}

_onClickNavigator(BuildContext context, Widget page) async {
  String s = await push(context, page);

  print(s);
}

_onClickSnack(context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text("Olá, Flutter!"),
      action: SnackBarAction(
        textColor: Colors.pink,
        label: "Ok",
        onPressed: () {
          print("ok");
        },
      ),
    ),
  );
}

_onClickDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(
            "Flutter é muito legal!",
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
                print("OK!!!");
              },
            ),
          ],
        ),
      );
    },
  );
}

_onClickToast() {
  Fluttertoast.showToast(
      msg: "Flutter é muito legal!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      fontSize: 16.0);
}

_onClickFab() {}
