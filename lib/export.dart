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

class Export extends StatefulWidget {
  Country country;
  Export(this.country) {}
  @override
  static const routename = '/Export';
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  bool isloading;
  bool isloading1;
  void work1(String k, String v) async {
    final dbreference1 = FirebaseDatabase.instance.reference();
    await dbreference1
        .child(widget.country.name + '/manufacturing')
        .once()
        .then((DataSnapshot data1) {
      if (data1 != null) {
        //print(data1.value.keys);
        var keys1 = data1.value.keys;
        //print(keys1.runtimeType);
        //print(keys1);
        var values = data1.value;
        //print(values);
        for (var key in keys1) {
          //print(values[key]);
          if (key == k) {
            conformationList.add(new _manufactureclass(
                k,
                values[key]['company'],
                values[key]['description'],
                values[key]['price'],
                v));
          } else
            print('data is empty');
        }
      }
    });
    setState(() {
      isloading1 = false;
    });
  }

  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    await dbreference
        .child(widget.country.name + '/exporting')
        .once()
        .then((DataSnapshot data) {
      if (data != null) {
        // print(data.value.keys);
        conformationList.clear();
        var keys = data.value.keys;
        //print(keys.runtimeType);
        //print(keys);
        var values = data.value;
        for (var key in keys) {
          var k = key;
          var v = values[key];
          print(k);
          print(v);
          work1(k, v);
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
      isloading1 = true;
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
              prod_quantity: conformationList[index].quantity);
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Export Details"),
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
            : conformationList.length == 0
                ? Text("Currently no exports",
                    style: TextStyle(fontSize: 20, color: Color(0xFF0C5584)))
                : generateItemsList()
      ])),
      // SingleChildScrollView(
      // child: Column(
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
