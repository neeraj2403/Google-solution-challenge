// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/countryhome.dart';
import 'product.dart';
import 'dart:async';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';

final database = FirebaseDatabase.instance.reference();

class OrderPage extends StatefulWidget {
  Country country;
  Product products;
  OrderPage(this.products) {
    print(products.tocountry);
  }
  @override
  _OrderPageState createState() => _OrderPageState();
  static const routename = '/OrderPage';
}

class _OrderPageState extends State<OrderPage> {
  bool isloading;
  void work() {
    bool found = false;
    String data = widget.products.tocountry + '/';

    database.child(data).once().then((data) {
      if (data != null) {
        print(data.value);
        print(data.value.keys);

        var values = data.value;

        widget.country = Country(
            username: values['username'],
            password: values['password'],
            name: values['name']);
        print('over here');
      }
    });
    setState(() {
      isloading = false;
    });
  }
  // @override
  // void work1() async {
  //   final dbreference = FirebaseDatabase.instance.reference();
  //   String data = widget.products.tocountry + '/exporting';
  //   int oldvalue;
  //   await dbreference.child(data).once().then((DataSnapshot data1) {
  //     if (data1 != null) {
  //       // print(data.value.keys);
  //       var keys = data1.value.keys;
  //       print(keys.runtimeType);
  //       print(keys);
  //       var values = data1.value;
  //       for (var key in keys) {
  //         if (key == widget.products.name) {
  //           oldvalue = values[key];
  //         }
  //       }
  //       ;
  //     }
  //   });
  //   print("done searching");
  //   int newvalue = oldvalue - int.parse(widget.products.quantity);
  //   setState(() {
  //     print("halloo");
  //     {
  //       dbreference.child(data).update({'${widget.products.name}': newvalue});
  //     }
  //   });
  // }

  // @override
  // void work2() async {
  //   final dbreference = FirebaseDatabase.instance.reference();
  //   String data = widget.products.country + '/exporting';
  //   int oldvalue1;
  //   await dbreference.child(data).once().then((DataSnapshot data2) {
  //     if (data2 != null) {
  //       // print(data.value.keys);
  //       var keys = data2.value.keys;
  //       print(keys.runtimeType);
  //       print(keys);
  //       var values = data2.value;
  //       for (var key in keys) {
  //         if (key == widget.products.name) {
  //           oldvalue1 = values[key];
  //         }
  //       }
  //       ;
  //     }
  //   });
  //   print("done searching");

  //   setState(() {
  //     print("halloo");
  //     {
  //       dbreference.child(data).update({
  //         '${widget.products.name}':
  //             oldvalue1 - int.parse(widget.products.quantity)
  //       });
  //       isloading = false;
  //     }
  //   });
  // }
  // @override
  // work() async {
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     setState(() {
  //       isloading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    setState(() {
      isloading = true;
      work();
      _loadWidget();
      // work1();
      // work2();
    });
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, CountryHome.routename,
        arguments: widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Page'),
          backgroundColor: Color(0xFF0C5584),
        ),
        body: Center(
            child: Stack(children: <Widget>[
          isloading
              ? CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xFF0C5584)),
                  semanticsLabel: "Loading..",
                  semanticsValue: "Loading..",
                )
              : Container(
                  child: Column(children: [
                  Text("Congratulations!!",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF0C5584),
                          fontWeight: FontWeight.bold)),
                  Text("The order has been placed successfully",
                      style: TextStyle(fontSize: 15, color: Colors.black))
                ]))
        ])));
  }
}
