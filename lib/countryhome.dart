import 'package:flutter/material.dart';
import 'package:medicare/country.dart';
import 'manufacture.dart';
import 'requests.dart';
import 'export.dart';

class CountryHome extends StatefulWidget {
  static const routename = '/CountryHome';
  Country country;
  CountryHome(this.country) {
    print(country.name);
  }
  @override
  _CountryHomeState createState() => _CountryHomeState();
}

/// This is the private State class that goes with MyStatefulWidget.
// ignore: camel_case_types
class _CountryHomeState extends State<CountryHome> {
  @override
  void initState() {
    super.initState();
  }

  void func() {}
  @override
  Widget cardcreator(String name, BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (name == "Manufacture Details") {
                  Navigator.pushNamed(context, Manufacture.routename,
                      arguments: widget.country);
                } else if (name == "Export Details") {
                  //             if (widget.citizen.isvaccinated == false)
                  Navigator.pushNamed(context, Export.routename,
                      arguments: widget.country);
                } else if (name == "Import Request") {
                  //             if (widget.citizen.isvaccinated == false)
                  Navigator.pushNamed(context, RequestsPage.routename,
                      arguments: widget.country);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0C5584),
          title: Row(
            children: <Widget>[
              Text("HomePage"),
              SizedBox(width: 10),
            ],
          ),
        ),
        drawer: Drawer(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFFB2E0EA), Color(0xFF0C5584)])),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'MENU BAR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            cardcreator('Manufacture Details', context),
                            cardcreator('Export Details', context),
                            cardcreator('Import Request', context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))),
        body: SingleChildScrollView(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFB2E0EA), Color(0xFF0C5584)])),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.red])),
                ),
                Text("\nHi ${widget.country.name}"),
                Text('\nWelcome To MediCare',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Text('"Healing Together"\n',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic)),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(
                            "Hi ${widget.country.name}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0C5584),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "MediCare helps in\n effective distribution of \n the medicines & vaccines\n throughout the world!!",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]))),
              ],
            ),
          ),
        )));
  }
}
