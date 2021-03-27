// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Products extends StatefulWidget {
//   @override
//   _ProductsState createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//   @override
//   var product_list = [
//     {
//       "name": "All out",
//       "Country": "USA",
//       "description": "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful ",
    
      
//       "price": 85,
//     },
//     // {
//     //   "name": "Shampoo",
      
//     //   "price": 185,
//     // },
//     // {
//     //   "name": "All out",
      
//     //   "price": 85,
//     // },
//     // {
//     //   "name": "Shampoo",
//     //   "price": 185,
//     // },
    
//   ];
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIOverlays([]);

//     return ListView.builder(
//         itemCount: product_list.length,
        
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Single_prod(
//               prod_name: product_list[index]['name'],
//               prod_description: product_list[index]['description'],
//               prod_countries: product_list[index]['countries'],
//               prod_price: product_list[index]['price'],
//             ),
//           );
//         });
//   }
// }

// class Single_prod extends StatelessWidget {
//   final prod_name;
//   final prod_countries;
//   final prod_description;
//   final prod_price;

//   Single_prod({
//     this.prod_name,
//     this.prod_countries,
//     this.prod_description,

//     this.prod_price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         child: Hero(
//       tag: new Text("Hero1"),
//       child: Material(
//         child: InkWell(
//           onTap: () => {},
//           child: GridTile(
//             footer: Container(
//                 color: Colors.white70,
//                 child: new Row(
//                   children: [
//                     Expanded(
//                       child: new Text(
//                         prod_name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16.0),
//                       ),
//                     ),
//                     new Text(
//                       '$prod_price',
//                       style: TextStyle(
//                           color: Colors.cyan, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 )),
//             // child: Image.asset(
//             //   prod_pictures,
//             //   fit: BoxFit.cover,
//             // ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
