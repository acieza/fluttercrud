import 'package:flutter/material.dart';
import 'package:fluttercrud/models/cases.dart';
import 'package:fluttercrud/pages/caseslist.dart';
import 'package:fluttercrud/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Listado de Usuarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();

  List<Cases> casesList;

  @override
  Widget build(BuildContext context) {
    if (casesList == null) {
      casesList = List<Cases>();
    } else {}

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return casesList.length > 0
                  ? CasesList(cases: casesList)
                  : Center(child: Text("No existen Datos, Añade uno"));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Cases>> futurecase = api.getCases();
    futurecase.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
  }
}
