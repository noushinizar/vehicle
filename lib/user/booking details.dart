import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/booking_cancel.dart';
import 'package:vehicle/widgets/background-image.dart';
class b_details extends StatefulWidget {
  const b_details({Key? key}) : super(key: key);

  @override
  State<b_details> createState() => _b_detailsState();
}

class _b_detailsState extends State<b_details> {
  String booking_id="";
  String login_id="";
  List bookings = [];
  List Users=[];
  String status="";
  String User_id="";
  late SharedPreferences local;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewBookings();

  }

  ViewBookings() async{
    local= await SharedPreferences.getInstance();
    User_id=(local.getString('user_id')?? '');
    print('user_id ${User_id}');

    var res = await Api().getData('booking/user-booked-drivers/'+User_id.replaceAll('"', ''));
    print(res);
    if(res.statusCode==400){
      var items = jsonDecode(res.body);
      print('datas ${items}');
      setState(() {
        bookings= items['data'];

      });


    }else{
      setState(() {
        bookings=[];
      });
    }
  }

  deleteData(String _id) async{
    setState(() {
      var isloading = true;
    });
    String log_id= login_id.replaceAll('"', '');
    print(log_id);
    var res= await Api().getData('booking/delete-booking/'+booking_id.replaceAll('"', ''));
    var body = jsonDecode(res.body);

    if(body['success']== true){
      print('body${body}');
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>cancel_page()));
    }else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Booking details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      booking_id= bookings[index]['_id'];
                      local.setString('_id',booking_id.toString());
                      status= bookings[index]['Status'];
                      local.setString('Status',status.toString());
                      print(status);
                      return Card(
                        child: ExpansionTile(
                          trailing: IconButton(
                            onPressed: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>cancel_page()));
                            deleteData(booking_id);
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),),

                          /* height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,*/
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    /* Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage('know_your_ride_backend/public/images/'+Vehicles[index]['Photo']),

                                                fit: BoxFit.cover)
                                        ),
                                      ),
                                    ),*/
                                    Text(
                                     bookings[index]['Driver_name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),

                                  ]),
                            ],
                          ),

                         subtitle:
                            status == 1 ?
                            Text('Rejected',style:TextStyle(fontSize: 20,color: Colors.red) ,)
                                :Text('Accepted',style: TextStyle(fontSize: 20,color: Colors.green),),
                          /*  Row(
                            children: [
                              Text(
                                bookings[index]['From_date'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(' - ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                              Text(
                                bookings[index]['To_date'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),*//* Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             *//* Text(' Phone no   :', style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),),
                              Text(bookings[index]['Driver_Phone'], style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),),*//*

                             *//* Text(' Amount  :', style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),),
                              Text(bookings[index]['Amount'], style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),)*//*
                            ],
                          ),*/

                         children: [
                           ListTile(
                             title: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(' Amount   :', style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),
                                     Text(bookings[index]['Amount'], style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),

                                   ]
                                 ),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(' Phone no   :', style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),
                                     Text(bookings[index]['Driver_Phone'], style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),

                                     /* Text(' Amount  :', style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),),
                              Text(bookings[index]['Amount'], style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),)*/
                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(' FromDte  :', style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),
                                     Text(bookings[index]['From_date'], style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),)
                                   ],
                                 ),

                                 SizedBox(height: 10,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(' ToDate   :', style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),
                                     Text(bookings[index]['To_date'], style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),)
                                   ],
                                 ),
                                 SizedBox(height: 10,),

                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(' Licence no  :', style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),),
                                     Text(bookings[index]['License_no'], style: TextStyle(
                                         fontWeight: FontWeight.w400, fontSize: 22),)
                                   ],
                                 ),

                               ],
                             ),
                           )
                         ],

                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
