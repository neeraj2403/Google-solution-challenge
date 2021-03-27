import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'country.dart';






// class AddMedicine extends StatefulWidget {
//   static const routename = '/AddMedicine';
//   // Country country;
//   // AddMedicine(this.country) {
//   //   print('constructor mob: ' + country.username);
//   // }
//   @override
//   _AddMedicineState createState() => _AddMedicineState();
// }

// class _AddMedicineState extends State<AddMedicine> {
//   @override
//   // void initState() {
//   //   super.initState();
//   // }

//   Widget build(BuildContext context) {
    
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("Shipment"),
//     //     backgroundColor: Color(0xFF0C5584),
//     //   ),



//     // );
//   }
// }



class Products extends StatefulWidget {
  @override
  static const routename = '/Products';
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  var product_list = [
    {
      "name": "All out",
      "countries": "USA",
      "description": "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful ",
    
      
      "price": 85,
    },
    {
      "name": "All out",
      "countries": "USA",
      "description": "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful ",
    
      
      "price": 85,
    },
    {
      "name": "All out",
      "countries": "USA",
      "description": "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful ",
    
      
      "price": 85,
    },
    // {
    //   "name": "Shampoo",
      
    //   "price": 185,
    // },
    // {
    //   "name": "All out",
      
    //   "price": 85,
    // },
    // {
    //   "name": "Shampoo",
    //   "price": 185,
    // },
    
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body:SingleChildScrollView(
      child: Column(
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
        ListView.builder(
             itemCount: product_list.length,

             scrollDirection: Axis.vertical,
             itemBuilder: (BuildContext context, int index) {
               return Single_prod(
                 prod_name: product_list[index]['name'],
                 prod_description: product_list[index]['description'],
                 prod_countries: product_list[index]['countries'],
                 prod_price: product_list[index]['price'],
               );
             })],)));
        
      
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_countries;
  final prod_description;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_countries,
    this.prod_description,

    this.prod_price,
  });
  
   @override
  Widget build(BuildContext context) {

    double c_width = MediaQuery.of(context).size.width*0.9;
    return Container(
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
                Text(prod_name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
              Text(prod_countries,style: TextStyle(fontSize: 12),),
              
            ],),
          ),
         
        ],
      ),
    );


  }
  }