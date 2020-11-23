import 'package:flutter/material.dart';
import 'package:fluttercrud/models/cases.dart';
import 'package:fluttercrud/services/api_service.dart';

enum Gender { Male, Female }
enum Status { Positive, Dead, Recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  String id = '';
  String gender = 'Male';
  Gender _gender = Gender.Male;
  String status = 'Positive';
  Status _status = Status.Positive;

  @override
  void initState() {
    id = widget.cases.id;
    _nameController.text = widget.cases.name;
    gender = widget.cases.gender;
    if (widget.cases.gender == 'Male') {
      _gender = Gender.Male;
    } else {
      _gender = Gender.Female;
    }
    _ageController.text = widget.cases.age.toString();
    _addressController.text = widget.cases.address;
    _cityController.text = widget.cases.city;
    _countryController.text = widget.cases.country;
    status = widget.cases.status;
    if (widget.cases.status == 'Positive') {
      _status = Status.Positive;
    } else if (widget.cases.status == 'Dead') {
      _status = Status.Dead;
    } else {
      _status = Status.Recovered;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Usuario'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(hintText: 'Nombre Completo'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'introduce Nombre';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Hombre'),
                            leading: Radio(
                              value: Gender.Male,
                              groupValue: _gender,
                              onChanged: (Gender value) {
                                setState(() {
                                  _gender = value;
                                  gender = 'Male';
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Mujer'),
                            leading: Radio(
                              value: Gender.Female,
                              groupValue: _gender,
                              onChanged: (Gender value) {
                                setState(() {
                                  _gender = value;
                                  gender = 'Female';
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(hintText: 'Edad'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'introduce Edad';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(hintText: 'Dirección'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'introduce Direccion';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: _countryController,
                      decoration: const InputDecoration(hintText: 'Pais'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'introduce Pais';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(hintText: 'Ciudad'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'introduce Ciudad';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Positivo'),
                            leading: Radio(
                              value: Status.Positive,
                              groupValue: _status,
                              onChanged: (Status value) {
                                setState(() {
                                  _status = value;
                                  status = 'Positive';
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Muerto'),
                            leading: Radio(
                              value: Status.Dead,
                              groupValue: _status,
                              onChanged: (Status value) {
                                setState(() {
                                  _status = value;
                                  status = 'Dead';
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Recuperado'),
                            leading: Radio(
                              value: Status.Recovered,
                              groupValue: _status,
                              onChanged: (Status value) {
                                setState(() {
                                  _status = value;
                                  status = 'Recovered';
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        splashColor: Colors.red[200],
                        onPressed: () {
                          if (_addFormKey.currentState.validate()) {
                            _addFormKey.currentState.save();

                            api.updateCase(
                              id,
                              Cases(
                                name: _nameController.text,
                                gender: gender,
                                age: int.parse(_ageController.text),
                                address: _addressController.text,
                                city: _cityController.text,
                                country: _countryController.text,
                                status: status,
                              ),
                            );
                            Navigator.popUntil(
                                context,
                                ModalRoute.withName(
                                    Navigator.defaultRouteName));
                          }
                        },
                        child: Text(
                          'Usuario Grabado',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
