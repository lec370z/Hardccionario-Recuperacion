import 'package:flutter/material.dart';
import 'package:hardccionario/database.dart';

lengDatabase db = lengDatabase();


class Componentes extends StatelessWidget{
  String sql;

  Componentes(this.sql);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("componentes"),
        ),
        body: FutureBuilder(
          future: db.initDB(),
          builder: (BuildContext , snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _datos (context);
            } else {
              return Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              );
            }
          },
        )
    );
  }
  _datos(BuildContext context){
    return FutureBuilder(
      future: db.getDatabase(),
      builder: (BuildContext context, AsyncSnapshot<List<componentes>> snapshot){
        print(snapshot.hasData);
        if(snapshot.hasData){
          return ListView(
            children: <Widget>[
              for (componentes len in snapshot.data) ListTile(title: Text(len.nombre))
            ],
          );
        }else{
          return Center(
            child:Text("404 not font"),
          );
        }
      },
    );
  }

}