//import 'package:covac/otp.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'citizen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//User user;
//Citizen citizen;
final namecontroller = TextEditingController();
final agecontroller = TextEditingController();
final housenocontroller = TextEditingController();
final pincodecontroller = TextEditingController();
final countrycontroller = TextEditingController();
final diseasecontroller = TextEditingController();
final occupationcontroller = TextEditingController();
final mobilenocontroller = TextEditingController();
final medicinecontroller = TextEditingController();
final dosagecontroller = TextEditingController();
//final dbref = FirebaseDatabase.instance.reference();

//void register(
//  {String name,
//int age,
//    int houseno,
//  int pincode,
//String streetname,
//    String location,
//  String occupation,
//int aadharcardno,
//    int mobileno,
//  String state,
//BuildContext context}) {
//citizen = Citizen(
//name: name,
//age: age,
//aaharcardno: aadharcardno,
// houseno: houseno,
//location: location,
//mobileno: mobileno,
//pincode: pincode,
//state: state,
//streetname: streetname,
//occupation: occupation);

//if(user == null){

//dbref.child("citizen/${citizen.mobileno}").set({
//    'name': citizen.name,
//  'age': citizen.age,
//'occupation': citizen.occupation,
//    'mobileno': citizen.mobileno,
//    'pincode': citizen.pincode,
//    'houseno': citizen.houseno,
//    'aadharcardno': citizen.aaharcardno,
//    'state': state,
//    'streetname': citizen.streetname,
//    'date': DateTime.now().toString(),
//    'isbooked': citizen.isbooked,
//    'isvaccinated': citizen.isvaccinated,
//    'isrequestbooking': citizen.isrequestbooking,
//    'placebooked': "none",
//    'isbadge1': citizen.isbadge1,
//    'isbadge2': citizen.isbadge2,
//    'isbadge3': citizen.isbadge3,
//    'isbadge4': citizen.isbadge4,
//    'isbadge5': citizen.isbadge5,
//    'badgeno': citizen.badgeno,
//  }).then((onValue) {
//  print('in register()');

// //  login(citizen.mobileno.toString(),context);
// Navigator.pushReplacementNamed(
//   context, CitizenHomePage.routename,arguments: citizen);
//Navigator.pushReplacementNamed(context, OTPScreen.routename,
//  arguments: citizen);
// });
//}

class FormRegister extends StatefulWidget {
  static const routename = '/FormRegister';

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool notregistered = true;
  static List<String> friendsList = [null];
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Citizen Registeration"),
          backgroundColor: Color(0xFF0C5584),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFB2E0EA), Color(0xFF0C5584)])),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //  if(citizen != null)
                  //  Center(child:
                  //  SpinKitDualRing(color: Colors.black,
                  //  duration: Duration(seconds: 1),) ,),

                  // if (citizen == null)
                  Column(children: [
                    Container(
                        width: 300,
                        height: 300,
                        child: ClipOval(child: Image.asset('assets/form.jpg'))),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0, left: 30, right: 30, bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            width:
                                8.5 * (MediaQuery.of(context).size.width / 10),
                            margin: EdgeInsets.only(top: 60),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, 0.2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: agecontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Age",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: occupationcontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Occupation",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: housenocontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Houseno,Street name State",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: pincodecontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Pincode",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: countrycontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Country",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: mobilenocontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mobile Number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextFormField(
                                    controller: diseasecontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name of diseases",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                ..._getFriends(),
                                // Container(
                                //           child: Row(
                                //         children: [
                                //           Container(
                                //             width: 200,
                                //             padding: EdgeInsets.all(8.0),
                                //             decoration: BoxDecoration(
                                //                 border: Border(
                                //                     right: BorderSide(
                                //                         color: Colors.grey[200]),
                                //                     bottom: BorderSide(
                                //                         color: Colors.grey[200]))),
                                //             child: TextFormField(
                                //               controller: medicinecontroller,
                                //               decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: "Medicines",
                                //                   hintStyle: TextStyle(
                                //                       color: Colors.grey[400])),
                                //             ),
                                //           ),
                                //           Container(
                                //             width: 100,
                                //             padding: EdgeInsets.all(8.0),
                                //             decoration: BoxDecoration(
                                //                 border: Border(
                                //                     bottom: BorderSide(
                                //                         color: Colors.grey[200]))),
                                //             child: TextFormField(
                                //               controller: dosagecontroller,
                                //               decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: "Dosage",
                                //                   hintStyle: TextStyle(
                                //                       color: Colors.grey[400])),
                                //             ),
                                //           ),
                                //         ],
                                //       )),
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.all(30),
                                //   child: FloatingActionButton(
                                //       backgroundColor: Colors.white,
                                //       elevation: 10,
                                //       child: new Icon(
                                //         Icons.add,
                                //         color: Color(0xFF0C5584),
                                //         size: 30,
                                //       )),
                                // ),
                                Container(
                                  height: 1.4 *
                                      (MediaQuery.of(context).size.height / 20),
                                  width: 8.5 *
                                      (MediaQuery.of(context).size.width / 10),
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: RaisedButton(
                                      elevation: 5.0,
                                      color: Color(0xFF0C5584),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
//
                                      // onPressed: () {
                                      //   confirmuserifexits(
                                      //       _usernamecontroller.text.trim(),
                                      //       _passwordcontroller.text.trim(),
                                      //       _countrycontroller.text.trim());

                                      //   _usernamecontroller.clear();
                                      //   _passwordcontroller.clear();
                                      //   _countrycontroller.clear();
                                      // },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                          // letterSpacing: 1.8,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          // RaisedButton(
                          //   onPressed: () {
                          //     print("register pressed");
                          //     //register(
                          //     //name: namecontroller.text.trim(),
                          //     //location: locationcontroller.text.trim(),
                          //     //occupation: occupationcontroller.text.trim(),
                          //     //state: statecontoller.text.trim(),
                          //     //streetname: streetnamecontroller.text.trim(),
                          //     //aadharcardno: int.parse(aadharcardconrtroller.text),
                          //     //age: int.parse(agecontroller.text),
                          //     //houseno: int.parse(housenocontroller.text),
                          //     //mobileno: int.parse(mobilenocontroller.text),
                          //     //pincode: int.parse(pincodecontroller.text),
                          //     //context: context);
                          //   },
                          //   child: Text("Register!",
                          //       style: TextStyle(fontWeight: FontWeight.bold)),
                          //   textColor: Color(0xFF0C5584),
                          //   color: Colors.white,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10)),
                          // )
                        ],
                      ),
                    )
                  ])
                ],
              ),
            ),
          ),
        ));
  }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, null);
        } else
          friendsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _FormRegisterState.friendsList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _FormRegisterState.friendsList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
