import 'package:flutter/material.dart';
import 'package:medicare/Components/profile.dart';

import 'Addmedicine.dart';
import 'Landingpage.dart';
import 'Requests.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}



/// This is the private State class that goes with MyStatefulWidget.
// ignore: camel_case_types
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
 
  //     ];
  final List<Widget> _widgetOptions = <Widget>[
    ChartsDemo(),
    RequestsPage(),
    AddMedicine(),
    ProfilePage(),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Navigation());
  }

  Scaffold Navigation() {
    return Scaffold(
    // appBar: AppBar(
    //   title: const Text('BottomNavigationBar Sample'),
    // ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.receipt_long_rounded),
        //   label: 'Request',
        // ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,

          icon: Icon(Icons.receipt_long_sharp),
          
          label: 'Requests',
          
        ),
        BottomNavigationBarItem(
          
          icon: Icon(Icons.control_point),
          backgroundColor: Colors.black,
          label: 'Add medicine',


        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_sharp),
          label: 'Profile',
          backgroundColor: Colors.black,
          
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
  );
  }
}


