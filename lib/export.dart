import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';

class _manufactureclass {
  String name, company, description, price;
  int quantity;
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
  @override
  void work() async {
    final dbreference = FirebaseDatabase.instance.reference();
    await dbreference
        .child(widget.country.name + '/manufacturing')
        .once()
        .then((DataSnapshot data) {
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
          var _data = _manufactureclass(
            key,
            values[key]['company'],
            values[key]['description'],
            values[key]['price'],
            values[key]['quantity'],
          );
          conformationList.add(_data);
        }
      } else
        print('data is empty');
    });
    setState(() {
      print("hallo");
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      work();
      isloading = true;
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
          );
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

  Single_prod({
    this.prod_name,
    this.prod_company,
    this.prod_description,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
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
            margin: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prod_company,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
