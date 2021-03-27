import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
  static const routename = '/RequestsPage';

}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      title: const Text('Requests Page'),
    ),
    
      
    );
  }
}