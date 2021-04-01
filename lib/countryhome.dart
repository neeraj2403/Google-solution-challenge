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
                            "Hi ${widget.country.name} !!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0C5584),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Your contribution helps MediCare to efficiently distribute the medicines & vaccines throughout the world guaranteeing a healthier world!!",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]))),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 700,
                    height: 240,
                    child: Image.asset('assets/deliver.jpg')),
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
                            "Seeking for a care, Medicare provides it !!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0C5584),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "We gaurantee universal health coverage by ensuring that all the medicines available in world market is available in your country too.\nFind shortage of any medicine, request it from anywhere in the world and get it delivered in your country",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RequestsPage.routename,
                                  arguments: widget.country);
                            },
                            child: Text(
                              'Request Imports',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            textColor: Colors.white,
                            color: Color(0xFF0C5584),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ]))),
                Text(
                  "\nStatistics of your country",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 380,
                    height: 250,
                    child: Image.asset('assets/disease.jpeg')),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 380,
                    height: 240,
                    child: Image.asset('assets/manufacture.jpeg')),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 380,
                    height: 240,
                    child: Image.asset('assets/export.jpeg')),
              ],
            ),
          ),
        )));
  }
}
