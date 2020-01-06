import 'package:base/pages/dog_page.dart';
import 'package:base/utils/nav.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Lista");

              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("Grid");

              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(context),
    );
  }

  _body(context) {
    List<Dog> dogs = [
      Dog("Dog 1", "assets/images/dog1.jpeg"),
      Dog("Dog 2", "assets/images/dog2.png"),
      Dog("Dog 3", "assets/images/dog3.jpg"),
      Dog("Dog 4", "assets/images/dog4.png"),
      Dog("Dog 5", "assets/images/dog5.jpg")
    ];

    if (_gridView) {
      return _grid(context, dogs);
    } else {
      return _list(context, dogs);
    }
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _list(context, dogs) {
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        return _itemView(dogs, index);
      },
    );
  }

  _grid(context, dogs) {
    return GridView.builder(
      itemCount: dogs.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _itemView(dogs, index);
      },
    );
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                dog.nome,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
