
import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Widget build(BuildContext context) {
        double c_width = MediaQuery.of(context).size.width*0.9;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
         leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => {},
  ), 
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                              Container(
                
                                  margin: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "Odomos",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                        
                                  ),
                                ),
    //                           Text(
    //   "Title",
    //   style: TextStyle(color: Colors.black, fontSize: 16.0),
    // ),
    // Text(
    //   'Sub Title',
    //   style: TextStyle(color: Colors.black, fontSize: 14.0),
    // ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text.rich(
                                    TextSpan(

                                    text:"United States of America",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 129, 192,1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  
                                  ),
                                  
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5,left:5),
                                  child: Text.rich(
                                    TextSpan(

                                    text:"Manufactured By : Dabur",
                                    style: TextStyle(
                                        color: Color.fromRGBO(236, 151, 89,1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  
                                  ),
                                  
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text.rich(
                                    TextSpan(

                                    text:"25/dose",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  
                                  ),
                                  
                                ),

                                Container(
                                  width: c_width,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromRGBO(59,91,108,1)
                                  ),),
                                ),
                                Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(left:25,right: 25,top:10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(237,246,251,1)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20.0),
                                        margin: const EdgeInsets.only(top:10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Quantity Available',),
                                            Text('100gm')
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20.0),
                                        margin: const EdgeInsets.only(top:5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          
                                          children: [
                                          Text('Qunatity Required'),
                                          Text('20gm')
                                        ],),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                                 Container(
                                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                                  width: 8.5 * (MediaQuery.of(context).size.width / 10),
                                  margin: EdgeInsets.only(bottom: 20,top: 20),
                                  child: RaisedButton(
                                      elevation: 5.0,
                                      color: Color.fromRGBO(0, 129, 192, 1.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      onPressed: () {},
                                      child: Text(
                                        'Checkout',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.height / 40,
                                              fontWeight: FontWeight.bold,
                                          // letterSpacing: 1.8,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                 
                                
              ],

              
            ),
          ),
        ),
      ),

    );
  }
}