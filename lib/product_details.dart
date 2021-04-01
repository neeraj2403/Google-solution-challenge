import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medicare/order.dart';
import 'sdetail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'country.dart';
import 'product.dart';
import 'package:fluttertoast/fluttertoast.dart';

class _manufactureclass {
  String i_name,
      i_country,
      i_quantity,
      i_tocountry,
      item_description,
      item_company,
      item_price;

  _manufactureclass(
      this.i_name,
      this.i_country,
      this.i_quantity,
      this.i_tocountry,
      this.item_description,
      this.item_company,
      this.item_price) {}
}

List<_manufactureclass> conformation = List<_manufactureclass>();
final quantitycontroller = TextEditingController();

class ProductDetails extends StatefulWidget {
  Detail item;
  ProductDetails(this.item) {
    print(item.item_name);
    print(item.item_country);
    print(item.item_quantity);
    print(item.item_tocountry);
  }
  @override
  static const routename = '/ProductDetails';

  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isloading;

  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    String data = widget.item.item_country + '/manufacturing';
    await dbreference.child(data).once().then((DataSnapshot data) {
      if (data != null) {
        conformation.clear();
        // print(data.value.keys);
        var keys = data.value.keys;
        print(keys.runtimeType);
        print(keys);
        var values = data.value;
        for (var key in keys) {
          if (key == widget.item.item_name) {
            conformation.add(new _manufactureclass(
                widget.item.item_name,
                widget.item.item_country,
                widget.item.item_quantity,
                widget.item.item_tocountry,
                values[key]['description'],
                values[key]['company'],
                values[key]['price']));
          }
        }
      } else
        print('data is empty');
    });
    print("done searching");

    setState(() {
      print("halloo");
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
        itemCount: conformation.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Product products = Product(
            name: conformation[index].i_name,
            country: conformation[index].i_country,
            tocountry: conformation[index].i_tocountry,
          );

          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Color.fromRGBO(237, 246, 251, 1),
              margin: EdgeInsets.all(15),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${conformation[index].i_name}',
                        style: TextStyle(
                            fontSize: 23,
                            color: Color(0xFF0C5584),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Manufactured By: ${conformation[index].item_company}, ${conformation[index].i_country}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF0C5584),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Price: ${conformation[index].item_price}\n',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF0C5584),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text('Description:',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      Text(
                        '${conformation[index].item_description}\n',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Quantity Available: ${conformation[index].i_quantity}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF0C5584),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          controller: quantitycontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Quantity Required",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          // Product products = Product(
                          //   name: conformation[index].i_name,
                          //   country: conformation[index].i_country,
                          //   tocountry: conformation[index].i_tocountry,
                          //   quantity: quantitycontroller.text.trim,
                          // );
                          print('${conformation[index].i_quantity}'.trimLeft());
                          String aStr = '${conformation[index].i_quantity}'
                              .replaceAll(new RegExp(r'[^0-9]'), '');
                          if (int.parse(quantitycontroller.text) <=
                              int.parse(aStr)) {
                            quantitycontroller.clear();
                            Navigator.pushNamed(context, OrderPage.routename,
                                arguments: products);
                          } else {
                            quantitycontroller.clear();
                            Fluttertoast.showToast(
                              msg: ' Input greater than available quantity ',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFF0C5584),
                              textColor: Colors.white,
                            );
                          }
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFF0C5584),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0C5584),
          elevation: 0,
          title: Text("Details Page"),
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
              : conformation.length == 0
                  ? Text("This item is removed by the manufacturer",
                      style: TextStyle(fontSize: 20, color: Color(0xFF0C5584)))
                  : generateItemsList(),
        ]))
        //
        );
  }
}
