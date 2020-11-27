import 'package:flutter/material.dart';
import 'package:fluttercrud/models/cases.dart';
import 'package:fluttercrud/pages/detailwidget.dart';

class CasesList extends StatelessWidget {
  final List<Cases> cases;
  CasesList({Key key, this.cases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cases == null ? 0 : cases.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(cases[index])));
          },
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(cases[index].name),
            subtitle: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: cases[index].age.toDouble() / 100,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        ));
      },
    );
  }
}
