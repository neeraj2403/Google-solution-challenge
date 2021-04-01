import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';

class _manufactureclass {
  String name, company, description, price, quantity;
  _manufactureclass(
      this.name, this.company, this.description, this.price, this.quantity) {}
}

List<_manufactureclass> conformationList = List<_manufactureclass>();
final database = FirebaseDatabase.instance.reference();

class Manufacture extends StatefulWidget {
  Country country;
  Manufacture(this.country) {
    print(country.name);
  }
  @override
  static const routename = '/Manufacture';
  _ManufactureState createState() => _ManufactureState();
}

class _ManufactureState extends State<Manufacture> {
  bool isloading;
  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    String data = widget.country.name + '/manufacturing';
    await dbreference.child(data).once().then((DataSnapshot data) {
      if (data != null) {
        // print(data.value.keys);
        conformationList.clear();
        var keys = data.value.keys;
        print(keys.runtimeType);
        print(keys);
        var values = data.value;
        for (var key in keys) {
          //       print('name: '+values[key]['name'].toString() +" mob:"+values[key]['mobileno'].toString());
          // conformationList.add(values[key]['feedback']) ;
          conformationList.add(new _manufactureclass(
              key,
              values[key]['company'],
              values[key]['description'],
              values[key]['price'],
              values[key]['quantity']));
        }
      } else
        print('data is empty');
    });
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isloading = true;
      work();
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
      isloading = true;
      work();
    });
  }

  ListView generateItemsList() {
    return ListView.builder(
        itemCount: conformationList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: conformationList[index].name,
            prod_description: conformationList[index].description,
            prod_company: conformationList[index].company,
            prod_price: conformationList[index].price,
            prod_quantity: conformationList[index].quantity,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Manufacture Details"),
        backgroundColor: Color(0xFF0C5584),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/ManufactureForm',
                      arguments: widget.country)
                  .then(onGoBack);
            },
          )
        ],
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
            : conformationList.length == 0
                ? Text("Currently no medicines are manufactured",
                    style: TextStyle(fontSize: 20, color: Color(0xFF0C5584)))
                : generateItemsList()
      ])),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_company;
  final prod_description;
  final prod_price;
  final prod_quantity;

  Single_prod({
    this.prod_name,
    this.prod_company,
    this.prod_description,
    this.prod_price,
    this.prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 1.2;
    return Flexible(
        child: Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      decoration: BoxDecoration(color: Color.fromRGBO(237, 246, 251, 1)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 2.0, left: 20.0),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prod_name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // Text('100gm')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prod_company,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: ' + prod_price,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity: ' + prod_quantity,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Description:\n' + prod_description,
                  style: TextStyle(fontSize: 10),
                )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
