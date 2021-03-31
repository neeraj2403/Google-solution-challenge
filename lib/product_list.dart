import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';
import 'product_details.dart';
import 'sdetail.dart';
import 'single.dart';

class _exportclass {
  String name, country, quantity, tocountry;
  _exportclass(
    this.name,
    this.country,
    this.quantity,
    this.tocountry,
  ) {}
}

List<_exportclass> conformationList = List<_exportclass>();
final database = FirebaseDatabase.instance.reference();

class ProductList extends StatefulWidget {
  Single prod;
  ProductList(this.prod) {
    print(prod.name);
    print(prod.quantity);
    print(prod.tocountry);
  }

  @override
  static const routename = '/ProductList';
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isloading;
  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    final dbreference1 = FirebaseDatabase.instance.reference();
    await dbreference.once().then((DataSnapshot data) {
      if (data != null) {
        //print(data.value.keys);
        conformationList.clear();
        var keys = data.value.keys;
        //print(keys.runtimeType);
        //print(keys);
        var values = data.value;
        //print(values);

        for (var key in keys) {
          var k = key;
          print(k);
          print(k.runtimeType);
          dbreference1
              .child(k + '/exporting')
              .once()
              .then((DataSnapshot data1) {
            print(data1);
            if (data1 != null) {
              print(data1.value.keys);
              var keys1 = data1.value.keys;
              print(keys1.runtimeType);
              print(keys1);
              var values = data1.value;
              print(values);
              for (var key in keys1) {
                print(values[key]);
                if (key == widget.prod.name) {
                  conformationList.add(new _exportclass(
                      key, k, values[key].toString(), widget.prod.tocountry));
                } else
                  print('data is empty');
              }
            }
          });
        }
      }
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

  ListView generateItemsList() {
    return ListView.builder(
        itemCount: conformationList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: conformationList[index].name,
            prod_country: conformationList[index].country,
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
        title: Text("List of Medicines"),
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
                ? Text("No results found",
                    style: TextStyle(fontSize: 20, color: Color(0xFF0C5584)))
                : generateItemsList()
      ])),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_country;
  final prod_quantity;
  final prod_tocountry;

  Single_prod({
    this.prod_name,
    this.prod_country,
    this.prod_quantity,
    this.prod_tocountry,
  });

  @override
  Widget build(BuildContext context) {
    Detail item = Detail(
        item_name: prod_name,
        item_country: prod_country,
        item_quantity: prod_quantity,
        item_tocountry: prod_tocountry);
    double c_width = MediaQuery.of(context).size.width * 0.9;
    return SingleChildScrollView(
        child: Container(
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
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prod_country,
                  style: TextStyle(fontSize: 12),
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
                  prod_quantity,
                  style: TextStyle(fontSize: 12),
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
              Navigator.pushNamed(context, ProductDetails.routename,
                  arguments: item);
            },
            child: Text(
              'View Product',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            textColor: Colors.white,
            color: Color(0xFF0C5584),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    ));
  }
}
