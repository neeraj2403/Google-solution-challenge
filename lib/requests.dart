import 'package:flutter/material.dart';
import 'country.dart';
import 'package:firebase_database/firebase_database.dart';


class _userclass{
  String username,feedback;
  _userclass(this.username,this.feedback){}
}

List<_userclass> conformationList =List<_userclass>() ;
final database =FirebaseDatabase.instance.reference();

class RequestsPage extends StatefulWidget {
  static const routename = '/RequestsPage';
  Country country;
  RequestsPage(this.country) {
    print('constructor mob: ' + country.username);
  }
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
 void work(){
  final dbreference = FirebaseDatabase.instance.reference();
  dbreference.child('feedbacks').once().then((DataSnapshot data ){
    if(data != null){
     // print(data.value.keys);
 conformationList.clear();
  var keys = data.value.keys;
  print(keys.runtimeType);
  print(keys);
    var values = data.value;
   for( var key in keys){

   //       print('name: '+values[key]['name'].toString() +" mob:"+values[key]['mobileno'].toString());
          // conformationList.add(values[key]['feedback']) ;
       conformationList.add(new _userclass(values[key],values[key]['feedback'] ));   
     }

    }
    else print('data is empty');
   
  });
}

 ListView generateItemsList() {
    return ListView.builder(
      itemCount: conformationList.length,
      itemBuilder: (context, index) {
        return Dismissible(
         key: Key(conformationList[index].username),
          child: InkWell(
              child: ListTile(title: Text('${conformationList[index].feedback}',
              style: TextStyle(fontWeight: FontWeight.bold),),
             leading: Text('mobile: ${conformationList[index].username}'),
              )
              ),
        );
      },
    );
  }
   @override
 void initState(){
   super.initState();
   work();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        backgroundColor: Color(0xFF0C5584),,
      ),
      body: generateItemsList(),
      
    );
  }
}




