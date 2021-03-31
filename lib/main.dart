import 'package:flutter/material.dart';
import 'package:medicare/order.dart';
import 'package:medicare/product_list.dart';
import 'export.dart';
import 'sdetail.dart';
import 'medicine_data.dart';
import 'product_details.dart';
import 'home.dart';
import 'form.dart';
import 'login.dart';
import 'dart:async';
import 'countryhome.dart';
import 'country.dart';
import 'manufacture.dart';
import 'requests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'single.dart';
import 'product.dart';
import 'manufacture_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(fontFamily: 'Montserrat'),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: MainPage(title: 'Medi'),
      routes: {
        FormRegister.routename: (ctx) => FormRegister(),
        Login.routename: (ctx) => Login(),
        HomePage.routename: (ctx) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == CountryHome.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return CountryHome(args as Country);
          });
        } else if (settings.name == Manufacture.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return Manufacture(args as Country);
          });
        } else if (settings.name == RequestsPage.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return RequestsPage(args as Country);
          });
        } else if (settings.name == Export.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return Export(args as Country);
          });
        } else if (settings.name == ProductList.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ProductList(args as Single);
          });
        } else if (settings.name == ProductDetails.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ProductDetails(args as Detail);
          });
        } else if (settings.name == OrderPage.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return OrderPage(args as Product);
          });
        } else if (settings.name == ManufactureForm.routename) {
          final args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ManufactureForm(args as Country);
          });
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  var globaldata;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void func() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFB2E0EA), Color(0xFF0C5584)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  width: 300,
                  height: 300,
                  child:
                      ClipOval(child: Image.asset('assets/distribution.jpg'))),
              Text(
                "\nMediCare",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: 'Montserrat-Bold',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Healing Together\n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("A Global Pharma Logistics ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
