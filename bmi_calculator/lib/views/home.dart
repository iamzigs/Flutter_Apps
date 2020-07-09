// import 'package:bmi_calculator/models/dropdown_model.dart';
import 'dart:wasm';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String genderValue = 'Male';
  double _bmi;
  final _age = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health App'.toUpperCase(),
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text('Calculate your \nbmi'.toUpperCase(),
                        style: GoogleFonts.poppins(fontSize: 25)),
                    SizedBox(height: height / 5),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Gender',
                                              style: GoogleFonts.poppins()),
                                          DropdownButtonFormField(
                                              value: genderValue,
                                              elevation: 16,
                                              items: [
                                                'Male',
                                                'Female'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    ));
                                              }).toList(),
                                              onChanged: (String newValue) {
                                                setState(() {
                                                  genderValue = newValue;
                                                });
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 35),

                                  // Age Container
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Age',
                                              style: GoogleFonts.poppins()),
                                          TextFormField(
                                            controller: _age,
                                            validator: (age) {
                                              if (age.isEmpty) {
                                                return 'Age required';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                // contentPadding: EdgeInsets.symmetric(vertical: 3)
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(height: 35),

                          //Height Container
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Height',
                                              style: GoogleFonts.poppins()),
                                          Container(
                                            width: width / 3.5,
                                            child: TextFormField(
                                              controller: _height,
                                              validator: (height) {
                                                if (height.isEmpty) {
                                                  return 'Height required';
                                                }
                                                return null;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  // contentPadding: EdgeInsets.symmetric(vertical: 3)
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  //Weight container
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Weight',
                                              style: GoogleFonts.poppins()),
                                          TextFormField(
                                            controller: _weight,
                                            validator: (weight) {
                                              if (weight.isEmpty) {
                                                return 'Weight required';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                // contentPadding: EdgeInsets.symmetric(vertical: 3)
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(height: 20),
                          RaisedButton(
                              onPressed: () {
                                var height = int.parse(_height.text);
                                var weight = int.parse(_weight.text);
                                if (_formKey.currentState.validate()) {
                                  print('Calculating BMI');
                                  setState(() {
                                    _bmi = weight / height;
                                    print(_bmi);
                                  });
                                } else {
                                  print('not working');
                                }
                                // print('Calculate Button Clicked');
                              },
                              color: Colors.blue,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text('Calculate'.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white))))
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
