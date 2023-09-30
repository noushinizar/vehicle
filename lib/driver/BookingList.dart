import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
class BookingList extends StatefulWidget {
  const BookingList({Key? key}) : super(key: key);

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
 String booking_id="";
 String login_id="";
  List bookings = [];
  List Users=[];
  String driver_id="";
  late SharedPreferences local;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewBookings();

  }
  @override

  ViewBookings() async{
    local= await SharedPreferences.getInstance();
    driver_id=(local.getString('driver_id')?? '');
    print('Driver_id ${driver_id}');

    var res = await Api().getData('booking/driver-view-booking/'+driver_id.replaceAll('"', ''));
    print(res);
    if(res.statusCode==400){
      var items = jsonDecode(res.body);
      print(items);
      setState(() {
        bookings= items['data'];

      });


    }else{
      setState(() {
        bookings=[];
      });
    }
  }

 /*Future<void> _viewPro() async {
   local = await SharedPreferences.getInstance();
   *//* loginid = (local.getString('login_id') ?? '');
   print('login_id${loginid}');*//*
   var res = await Api()
       .getData('user/view-user-profile/' + login_id.replaceAll('"', ''));
   var body = json.decode(res.body);
   print("body${body}");
   setState(() {
     Users=[];
   });
 }*/
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        BackgroundImage(image: 'images/bgimage.jpg'),
       Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(

    shrinkWrap: true,
    itemCount: bookings.length,
    itemBuilder: (context,index)
    {
     booking_id= bookings[index]['_id'];
     local.setString('_id',booking_id.toString());
     /*login_id = bookings[index]['User_id'];
     local.setString('User_id',login_id.toString());*/
    return
            Card(
              child: ExpansionTile(

                leading: Icon(Icons.location_on_outlined,color: Colors.black,),
                title: Text(
                      bookings[index]['Name'] ,
    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text(bookings[index]['Phone'],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing: Text(
                  'view',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                children: [
                  ListTile(

                    title: Column(
                      children: [
                        Text('Place  :     ${  bookings[index]['Place']}', style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('Destination  :   ${  bookings[index]['Destination']}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                        Text('FromDate  :     ${  bookings[index]['From_date']}'  ,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                        SizedBox(height: 3,),
                        Text('ToDate  :     ${  bookings[index]['To_date']}'  ,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                        SizedBox(height: 3,),
                        Text('Time  :     ${  bookings[index]['Time']}'   ,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                      ],
                    ),
      onTap: (){
    showDialog(context: context, builder: (context){
    return AlertBox(text: 'Confirm Ride');
    });
    }
    ),

                ],


              ),
            );
            /*Card(
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
            ),*/


    }),
      ),
    ]
    );
  }
}


