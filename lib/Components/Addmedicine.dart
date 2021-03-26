import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.red),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
      child:Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(top:60,left: 10),
            
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text('Available Medicines',
                style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(Icons.control_point, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ), 

              ],) ,),
                                Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(left:25,right: 25,top:10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(237,246,251,1)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top:2.0,left: 20.0),
                                        margin: const EdgeInsets.only(top:10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Odomos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            // Text('100gm')
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left:20.0),
                                        margin: const EdgeInsets.only(top:4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          
                                          children: [
                                          Text('United States Of America',style: TextStyle(fontSize: 12),),
                                          
                                        ],),
                                      ),
                                     
                                    ],
                                  ),
                                ),  
              ],
      )),
      
    );
  }
}