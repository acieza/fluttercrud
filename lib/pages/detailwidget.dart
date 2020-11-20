import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrud/models/cases.dart';
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
                children: <Widget>[Text('Nombre: ${widget.cases.name}')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
