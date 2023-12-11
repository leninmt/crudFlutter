import 'package:crud/src/Pages/save_page.dart';
import 'package:crud/src/db/operation.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  //para cuando lo llamamos
  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    Operation.note();

    return Scaffold(
      //ubicar un boton para navegar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE);
        },
      ),
      appBar: AppBar(
        title: Text("Listado"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Nota 1"),
            ),
            ListTile(
              title: Text("Nota 2"),
            ),
            ListTile(
              title: Text("Nota 3"),
            ),
            ListTile(
              title: Text("Nota 4"),
            )
          ],
        ),
      ),
    );
  }
}
