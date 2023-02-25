import 'package:flutter/material.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
class BookingList extends StatelessWidget {
  const BookingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        BackgroundImage(image: 'images/bgimage.jpg'),
       Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined,color: Colors.black,),
                title: Text('lakeview park',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text('Street no.3',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing: Text('1/2/2023 \n 2.30 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                
                onTap: (){
                  showDialog(context: context, builder: (context){
                      return AlertBox(text: 'Confirm Ride');
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined,color: Colors.black,),
                title: Text('KP Stadium',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text('Street no.6',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing: Text('1/2/2023 \n 10.00 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertBox(text: 'Confirm Ride');
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined,color: Colors.black,),
                title: Text('Airport',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text('Mv Street',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing: Text('1/2/2023 \n 11.30 am',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertBox(text: 'Confirm Ride',);
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined,color: Colors.black,),
                title: Text('sk Teater',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text('MG Road',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing: Text('1/2/2023 \n 4.00 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertBox(text: 'Confirm Ride');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    ]
    );
  }
}


