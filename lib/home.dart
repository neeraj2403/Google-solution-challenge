import 'package:flutter/material.dart';
import 'form.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  static const routename = '/Home';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
                if (name == "Form") {
                  Navigator.pushNamed(context, FormRegister.routename);
                } else if (name == "Login") {
                  //             if (widget.citizen.isvaccinated == false)
                  Navigator.pushNamed(context, Login.routename);
                }
                //                   arguments: widget.citizen)
                //             .then((value) {
                //         setState(() {
                //         _updatecitizeninfo();
                //       _getdata();
                //   });
                //                  });
                //              else {
                // if (citizen.date == null)
                // citizen.date =DateTime.now();

                //                  DateTime date = widget.citizen.date.add(Duration(days: 28));
                //                widget.day = date.day.toString();
                //              widget.month = date.month.toString();
                //            widget.year = date.year.toString();
                //          String dateinstring =
                //            widget.day + "/" + widget.month + "/" + widget.year;
                //      Navigator.pop(context);
                //    Fluttertoast.showToast(
                //    msg:
                //      'You have Already taken your first shot,\n Next shot is scheduled to ' +
                //        dateinstring,
                //                   toastLength: Toast.LENGTH_LONG,
                //                 gravity: ToastGravity.CENTER,
                //               timeInSecForIosWeb: 1,
                //             fontSize: 15,
                //           backgroundColor: Colors.blueGrey[900],
                //         textColor: Colors.white,
                //     );
                // }
                //              }
                //            }
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
              Text("Homepage"),
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
                            cardcreator('Form', context),
                            cardcreator('Login', context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))),
        body: Container(
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
                Text('\nMediCare',
                    style: TextStyle(
                        color: Color(0xFF0C5584),
                        fontSize: 45,
                        fontWeight: FontWeight.bold)),
                Text('"Healing Together"\n',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic)),
                Row(children: [
                  Column(children: [
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
                                "Purpose",
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
                                "Vision",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF0C5584),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "By 2030 achieve\nuniversal health coverage\n access to safe, effective,\n quality & affordable\nessential medicines &\nvaccines for all.",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]))),
                  ]),
                  Container(
                      width: 160,
                      height: 300,
                      child: Image.asset('assets/home2.jpeg'))
                ]),

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
                            "What we do?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0C5584),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "\n* We calculate the right amount of medicines and vaccines the countries require as per the data collected\n* Provides facility for the countries to request medicines they require from the manufacturing countries\n*Deals with timely distribustion of medicines & vaccines among and within countries ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ]))),

                Container(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/home1.jpeg')),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Work with us to improve the pharma logistics of your country!!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF0C5584),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\nA form is provided to collect the details of various medication the citizens of various countries are intaking.",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, FormRegister.routename);
                          },
                          child: Text(
                            'Form',
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
                ),
                // cardcreator('Earn  badges by completing challenges!', context),
                // Container(
                //   padding: EdgeInsets.all(5),
                // ),
              ],
            ),
          ),
        ));
  }
}
