import 'package:flutter/material.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _usernamecontroller = TextEditingController();
final _passwordcontroller = TextEditingController();
final _countrycontroller = TextEditingController();
final database = FirebaseDatabase.instance.reference();

class Login extends StatefulWidget {
  static const routename = '/Login';
  Country country;
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  void confirmuserifexits(String username, String password, String _country) {
    bool found = false;
    String data = _country + '/';

    database.child(data).once().then((data) {
      if (data != null) {
        if (data.value == null) {
          print('Wrong Country');
          Fluttertoast.showToast(
            msg: ' Country entered is incorrect!\nPlease try again',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xFF0C5584),
            textColor: Colors.white,
          );
        } else {
          print(data.value);
          print(data.value.keys);

          var values = data.value;

          if (values['username'] == username &&
              values['password'] == password) {
            found = true;

            widget.country = Country(
              username: values['username'],
              password: values['password'],
            );
            print('over here');
          }
          if (found) {
            print('found');

            // Navigator.pushReplacementNamed(context, CitizenHomePage.routename,
            //    arguments: widget._citizen);
          }
          if (found == false) {
            print('login failed!');
            Fluttertoast.showToast(
              msg:
                  ' Username or password entered is incorrect!\nPlease try again ',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xFF0C5584),
              textColor: Colors.white,
            );
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Color(0xFF0C5584),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Container(
              height: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFB2E0EA), Color(0xFF0C5584)]))),
          Center(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 300,
                      height: 300,
                      child: ClipOval(child: Image.asset('assets/person.png'))),
                  Text(
                    '\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextFormField(
                                  controller: _usernamecontroller,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) => value.isEmpty
                                      ? 'Enter your password'
                                      : null,
                                  controller: _passwordcontroller,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextFormField(
                                  controller: _countrycontroller,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Country",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height:
                              1.4 * (MediaQuery.of(context).size.height / 20),
                          width: 8.5 * (MediaQuery.of(context).size.width / 10),
                          margin: EdgeInsets.only(bottom: 20),
                          child: RaisedButton(
                              elevation: 5.0,
                              color: Color(0xFF0C5584),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
//
                              onPressed: () {
                                confirmuserifexits(
                                    _usernamecontroller.text.trim(),
                                    _passwordcontroller.text.trim(),
                                    _countrycontroller.text.trim());

                                _usernamecontroller.clear();
                                _passwordcontroller.clear();
                                _countrycontroller.clear();
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
                ],
              ),
            ),
          ),
        ])));
  }
}
