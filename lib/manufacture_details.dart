import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ManufacturePage extends StatefulWidget {
  @override
  _ManufacturePageState createState() => _ManufacturePageState();
}

class _ManufacturePageState extends State<ManufacturePage> {
  String email, password, token;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              width: 8.5 *
                                  (MediaQuery.of(context).size.width / 10),
                              margin: EdgeInsets.only(top: 60),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                            
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, 0.2),
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
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        email = val;
                                      },
                                      
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    
                                    child: TextFormField(
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
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    // margin: EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        email = val;
                                      },
                                      
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Company",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    // margin: EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        email = val;
                                      },
                                      
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Price/dose",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    // margin: EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        email = val;
                                      },
                                      
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Quantity Available",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
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
                                      onChanged: (val) {
                                        email = val;
                                      },
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Description",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
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
                            color: Color.fromRGBO(40, 199, 237, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                            
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
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
