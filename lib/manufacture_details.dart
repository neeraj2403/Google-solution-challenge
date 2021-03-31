import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicare/form.dart';
import 'package:medicare/manufacture.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';

final namecontroller = TextEditingController();
final countrycontroller = TextEditingController();
final companycontroller = TextEditingController();
final pricecontroller = TextEditingController();
final quantitycontroller = TextEditingController();
final descriptioncontroller = TextEditingController();
final dbref = FirebaseDatabase.instance.reference();

class ManufactureForm extends StatefulWidget {
  Country country;
  ManufactureForm(this.country) {
    print(this.country.name);
  }
  @override
  _ManufactureFormState createState() => _ManufactureFormState();
  static const routename = '/ManufactureForm';
}

class _ManufactureFormState extends State<ManufactureForm> {
  String email, password, token;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manufacture Details"),
        backgroundColor: Color(0xFF0C5584),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        width: 8.5 * (MediaQuery.of(context).size.width / 10),
                        margin: EdgeInsets.only(top: 60),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, 0.2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                controller: namecontroller,
                                onChanged: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                controller: countrycontroller,
                                // obscureText: true,
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (value) => value.isEmpty
                                    ? 'Enter your password'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Country",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                controller: companycontroller,
                                onChanged: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Company",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                controller: pricecontroller,
                                onChanged: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Price/dose",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                controller: quantitycontroller,
                                onChanged: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Quantity Available",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                  // border: Border(
                                  //     bottom: BorderSide(
                                  //         color: Colors.grey[200])
                                  ),
                              child: TextFormField(
                                controller: descriptioncontroller,
                                onChanged: (val) {
                                  email = val;
                                },
                                maxLines: 6,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Description",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                  width: 8.5 * (MediaQuery.of(context).size.width / 10),
                  margin: EdgeInsets.only(bottom: 20),
                  child: RaisedButton(
                      elevation: 5.0,
                      color: Color(0xFF0C5584),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        dbref
                            .child(widget.country.name +
                                '/manufacturing/' +
                                namecontroller.text)
                            .set({
                          'company': companycontroller.text,
                          'price': pricecontroller.text,
                          'description': descriptioncontroller.text,
                          'quantity': quantitycontroller.text,
                        }).then((onValue) {
                          print('in register()');
                          companycontroller.clear();
                          namecontroller.clear();
                          pricecontroller.clear();
                          descriptioncontroller.clear();
                          quantitycontroller.clear();
                          countrycontroller.clear();
                          Fluttertoast.showToast(
                            msg: ' Successfully submitted the form! ',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xFF0C5584),
                            textColor: Colors.white,
                          );

                          // //  login(citizen.mobileno.toString(),context);
                          // Navigator.pushReplacementNamed(
                          //   context, CitizenHomePage.routename,arguments: citizen);
                          Navigator.pushReplacementNamed(
                              context, Manufacture.routename,
                              arguments: widget.country);
                        });
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          // letterSpacing: 1.8,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
