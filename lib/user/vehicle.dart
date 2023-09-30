import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/vBooking_page.dart';
import 'package:vehicle/user/vehicle_details.dart';

import '../widgets/background-image.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
 final List<String> Categories = ["Car","Bike",];
  String? valuechoose;
  List Vehicles=[];
 String Vehicle_id="";
 late SharedPreferences local;


  @override


  ViewVehicles() async{
    var res = await Api().getData('vehicle/vehicle-category/${valuechoose}');
    var body =json.decode(res.body);
  //  print(body);

    //local.setString('_id', Vehicle_id.toString());

    //Vehicle_id = json.encode(body['_id']).toString();



    if(res.statusCode==400){
      var body= jsonDecode(res.body);
      print('body${body}');

      local = await SharedPreferences.getInstance();



      setState(() {
        Vehicles= body['data'];


       // Vehicle_id = body['data'][0]['_id'];
        //print('vehicleid${Vehicle_id}');

      });

    }else{
      setState(() {
        Vehicles=[];
       // Fluttertoast.showToast(msg: msg)
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return  Stack(
        children: [
        BackgroundImage(image: 'images/bgimage.jpg'),

      Scaffold(

         backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Select Vehicle',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
        actions: [
          DropdownButton(
            dropdownColor: Colors.white,
            icon:Icon( Icons.filter_list_alt),
            iconSize: 36,
           // isExpanded: true,
            underline: SizedBox(),
           // hint: Text("select State"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            value: valuechoose ,
            onChanged: ( newvalue){
              setState(() {
                valuechoose = newvalue.toString() ;
                ViewVehicles();
                print(valuechoose);
              });
            },
            items: Categories.map((category) {
              return DropdownMenuItem(
                  value: category,
                  child: Text(category));
            }).toList(),
          ),

        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: Vehicles.length,
          itemBuilder: (context,index){
            Vehicle_id=Vehicles[index]['_id'];
            local.setString('vehicle_id',Vehicle_id.toString());

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>vehicle_details(
                  vmodel: Vehicles[index]['Vehicle_model'] ,
                 // vname: Vehicles[index]['Vehicle_model'] ,
                  modelyear: Vehicles[index]['Model_year'] ,
                  fuel: Vehicles[index]['Fuel_type'] ,
                  amount: Vehicles[index]['Amount'] ,
                  mailage: Vehicles[index]['Milage'] ,
                  image:Vehicles[index]['Photo'],

                ))),
                child: Container(
                  height:150 ,

                  width: 150,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                /*  Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: NetworkImage('https://imgd.aeplcdn.com/1280x720/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75'),fit: BoxFit.cover  ,)
                ),),*/
                    Expanded(
                      child: Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(image:  AssetImage('know_your_ride_backend/public/images/'+Vehicles[index]['Photo']),

                                 fit: BoxFit.cover)
                           ),
                        ),
                      ),

                    SizedBox(width: 10,),
                    Text(
                      //'Bike',
                     Vehicles[index]['Vehicle_model'] ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),),
                   SizedBox(width:60 ,),
                   /*Text( Vehicles[index]['Amount'] ,
                     style: TextStyle(
                       color: Colors.red,
                       fontSize: 30,
                       fontWeight: FontWeight.bold),)*/
                  ]),
                ),
              ),
          );
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Image.asset(
                        'images/Taxi.jpg',
                        fit: BoxFit.fitHeight),
                    SizedBox(width: 10,),
                    Text('Taxi', style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),),
                    SizedBox(width:60 ,),
                    *//*Text('100\$', style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),)*//*
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Image.asset(
                        'images/car.jpeg',
                        fit: BoxFit.fitHeight),
                    SizedBox(width: 10,),
                    Text('Car', style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),),
                    SizedBox(width:60 ,),
                   *//* Text('150\$', style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),)*//*
                  ]),
                ),
              ),
            ),*/
          }

    ),
      ),
    ),
    ]
    );

  }
}
