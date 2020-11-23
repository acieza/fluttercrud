import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrud/models/cases.dart';
import 'package:fluttercrud/pages/editdatawidget.dart';
import 'package:fluttercrud/services/api_service.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.cases);

  final Cases cases;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Usuario'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Nombre: ${widget.cases.name}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Género: ${widget.cases.gender}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Edad: ${widget.cases.age}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Dirección: ${widget.cases.address}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Pais: ${widget.cases.country}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Ciudad: ${widget.cases.city}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Estado: ${widget.cases.status}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                    child: Text(
                      'Updated: ${widget.cases.updated}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              splashColor: Colors.blue,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditDataWidget(widget.cases),
                                  ),
                                );
                              },
                              child: Text('Editar Registro'),
                            )),
                        RaisedButton(
                          splashColor: Colors.blue,
                          onPressed: () {
                            _confirmDialog();
                          },
                          child: Text('Eliminar Registro'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmación"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Estas Seguro de Eliminar el Registro?")
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    api.deleteCase(widget.cases.id);
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Text("Aceptar")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar"))
            ],
          );
        });
  }
}
