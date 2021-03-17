import 'package:flutter/material.dart';
//import 'package:covac/citizen.dart';
//import 'package:covac/citizen_home.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _namecontroller = TextEditingController();
final _mobilenocontroller = TextEditingController();

class Login extends StatefulWidget {
  static const routename = '/Login';
  //Citizen _citizen;
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  void confirmuserifexits(int mobileno, String name) {
    bool found = false;
    //final userref = FirebaseDatabase.instance.reference();
    //userref.child('citizen/').once().then((data) {
//      if (data != null) {
    //      print(data.value);
    //    var keys = data.value.keys;
    //  var values = data.value;
    //for (var key in keys) {
//          if (values[key]['name'] == name &&
    //            values[key]['mobileno'] == mobileno) {
    //        found = true;

//            widget._citizen = Citizen(
    //            aaharcardno: values[key]['aadharcardno'],
    //          age: values[key]['age'],
    //        date: DateTime.parse(values[key]['date']),
    //      houseno: values[key]['houseno'],
    //    isbooked: values[key]['isbooked'],
    //  isrequestbooking: values[key]['isrequestbooking'],
    //isvaccinated: values[key]['isvaccinated'],
//              mobileno: values[key]['mobileno'],
    //            name: values[key]['name'],
    //          occupation: values[key]['occupation'],
    //        pincode: values[key]['pincode'],
    //      placebooked: values[key]['placebooked'],
    //    state: values[key]['state'],
    //  streetname: values[key]['streetname'],
    //isbadge1: values[key]['isbadge1'],
//              isbadge2: values[key]['isbadge2'],
    //            isbadge3: values[key]['isbadge3'],
    //          isbadge4: values[key]['isbadge4'],
    //        isbadge5: values[key]['isbadge5'],
    //      badgeno: values[key]['badgeno'],
    //  );
    //print('over here');
    //if (found)
    //Navigator.pushReplacementNamed(context, CitizenHomePage.routename,
    //  arguments: widget._citizen);
    // else {
    print('login failed!');
    // Fluttertoast.showToast(
    //  msg: ' Name or MobileNumber entered is incorrect',
    //toastLength: Toast.LENGTH_LONG,
    // gravity: ToastGravity.CENTER,
    // timeInSecForIosWeb: 1,
    // backgroundColor: Colors.black,
    // textColor: Colors.white,
    //);
  }
  // }
  // }
  //     }
  // });
  //}

  // @override
//  void initState() {
  //  super.initState();
  // }

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
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _mobilenocontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _mobilenocontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Text('\n'),
                  SizedBox(
                      width: 300,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          // confirmuserifexits(int.parse(_mobilenocontroller.text.trim()),
                          //   _namecontroller.text.trim());
                          // _mobilenocontroller.clear();
                          // _namecontroller.clear();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFF0C5584),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ))
                ],
              ),
            ),
          ),
        ])));
  }
}
