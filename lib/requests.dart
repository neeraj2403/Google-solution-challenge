import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/form.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';
import 'product_list.dart';
import 'single.dart';

class _manufactureclass {
  String name, tocountry, quantity;
  _manufactureclass(this.name, this.quantity, this.tocountry) {}
}

List<_manufactureclass> conformationList = List<_manufactureclass>();
final database = FirebaseDatabase.instance.reference();

class RequestsPage extends StatefulWidget {
  Country country;

  RequestsPage(this.country) {
    print(country.name);
  }
  @override
  static const routename = '/RequestPage';
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  bool isloading;
  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    String data = widget.country.name + '/request';
    await dbreference.child(data).once().then((DataSnapshot data) {
      if (data != null) {
        // print(data.value.keys);
        conformationList.clear();
        var keys = data.value.keys;
        print(keys.runtimeType);
        print(keys);
        var values = data.value;
        for (var key in keys) {
          print(values[key]);
          print(values[key].runtimeType);
          conformationList.add(
              new _manufactureclass(key, values[key], widget.country.name));
        }
      } else
        print('data is empty');
    });
    setState(() {
      {
        isloading = false;
      }
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

  ListView generateItemsList() {
    return ListView.builder(
        itemCount: conformationList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: conformationList[index].name,
            prod_quantity: conformationList[index].quantity,
            prod_tocountry: conformationList[index].tocountry,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Import Request"),
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
                ? Text("Currently no requests",
                    style: TextStyle(fontSize: 20, color: Color(0xFF0C5584)))
                : generateItemsList()
      ])),
    );
  }
}

class Single_prod extends StatelessWidget {
  final String prod_name, prod_tocountry, prod_quantity;

  Single_prod({this.prod_name, this.prod_quantity, this.prod_tocountry});

  @override
  Widget build(BuildContext context) {
    Single product = Single(
        name: prod_name, quantity: prod_quantity, tocountry: prod_tocountry);
    double c_width = MediaQuery.of(context).size.width * 0.9;
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Text('100gm')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(top: 4, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity Required: ' + prod_quantity,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              //      Navigator.push(
              // context,
              // MaterialPageRoute(
              //   builder: (context)=>ProductList(name:prod_name)
              Navigator.pushNamed(context, ProductList.routename,
                  arguments: product);
            },
            child: Text(
              'Request',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            textColor: Colors.white,
            color: Color(0xFF0C5584),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
