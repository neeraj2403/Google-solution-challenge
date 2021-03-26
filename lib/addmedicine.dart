import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'country.dart';

class AddMedicine extends StatefulWidget {
  static const routename = '/AddMedicine';
  Country country;
  AddMedicine(this.country) {
    print('constructor mob: ' + country.username);
  }
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipment"),
        backgroundColor: Color(0xFF0C5584),
      ),
    );
  }
}
