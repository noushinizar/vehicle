import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/booking_cancel.dart';
import 'package:vehicle/widgets/Dialogbox.dart';

import '../widgets/background-image.dart';

class Rental extends StatefulWidget {
  const Rental({Key? key}) : super(key: key);

  @override
  State<Rental> createState() => _RentalState();
}

class _RentalState extends State<Rental> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewVehicles();
  }
  String booking_id="";
  List Vehicles = [];
  String user_id = "";
  late SharedPreferences local;

  @override
  ViewVehicles() async {
    local = await SharedPreferences.getInstance();
    user_id = (local.getString('user_id') ?? '');
    print(user_id);
    var res = await Api()
        .getData('rent//user-booked-vehicle/' + user_id.replaceAll('"', ''));
    var body = json.decode(res.body);
    if (res.statusCode == 400) {
      var items = jsonDecode(res.body);
      print('body${body}');

      local = await SharedPreferences.getInstance();

      setState(() {
        Vehicles = items['data'];

        // Vehicle_id = body['data'][0]['_id'];
        //print('vehicleid${Vehicle_id}');
      });
    } else {
      setState(() {
        Vehicles = [];
        //  Fluttertoast.showToast(msg: msg)
      });
    }
  }
  deleteData(String _id) async{
    setState(() {
      var isloading = true;
    });
    /*String log_id= login_id.replaceAll('"', '');
    print(log_id);*/
    var res= await Api().getData('rent/delete-booking/'+booking_id.replaceAll('"', ''));
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
              'Rental details',
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
                    itemCount: Vehicles.length,
                    itemBuilder: (context, index) {
                      booking_id= Vehicles[index]['_id'];
                      local.setString('_id',booking_id.toString());

                      return Card(
                        child: ListTile(
                          /*leading:  Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('know_your_ride_backend/public/images/'+Vehicles[index]['Photo']),

                                      fit: BoxFit.fitHeight)
                              ),
                            ),
                          ),*/
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

                                    Text(
                                      Vehicles[index]['Vehicle_model'],
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
                          Column(
                            children: [
                             /* Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' Name  :', style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),),
                                  Text(Vehicles[index]['name'], style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),)
                                ],
                              ),
                              SizedBox(height: 5,),*/
                             /* Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' Phone  :', style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),),
                                  Text(Vehicles[index]['phone'], style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),)
                                ],
                              ),*/
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' FromDate  :', style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),),
                                  Text(Vehicles[index]['From_date'], style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),)
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' ToDate  :', style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),),
                                  Text(Vehicles[index]['To_date'], style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),)
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(' Amount  :', style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),),
                                  Text(Vehicles[index]['amount'], style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 22),)
                                ],
                              ),
                            ],
                          ),
                          /* Row(
                                children: [
                                  Text(
                                    Vehicles[index]['From_date'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(' - ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                  Text(
                                    Vehicles[index]['To_date'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),*/


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
