import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/D_booking.dart';
import 'package:vehicle/user/Driver_details.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';

class FindDriver extends StatefulWidget {
  const FindDriver({Key? key}) : super(key: key);

  @override
  State<FindDriver> createState() => _FindDriverState();
}

class _FindDriverState extends State<FindDriver> {
  List Driver=[];
  String Driver_id="";
  late SharedPreferences local;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewDrivers();
  }
  @override

  ViewDrivers() async{
    var res = await Api().getData('driver/available-drivers');

    local = await SharedPreferences.getInstance();
    var body = jsonDecode(res.body);
    if(res.statusCode==200){
      var items = jsonDecode(res.body);
      print("items${items}");


      setState(() {
        Driver= items['result'];

      });


    }else{
      setState(() {
        Driver=[];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Choose Your Driver',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Driver.length,
              itemBuilder: (context,index)

              {
                Driver_id=Driver[index]['_id'];
                local.setString('_id', Driver_id.toString());
               // final String amount= ;

                return Card(
                  child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>D_details(


                          amount:Driver[index]['Amount'],
                          phone:Driver[index]['Phone'] ,
                          liceno:Driver[index]['License_no'],
                          age: Driver[index]['Age'],
                          vegornon:Driver[index]['Veg_or_non'],
                          gender: Driver[index]['Gender'],
                          hobby:Driver[index]['Hobby'],
                          name: Driver[index]['Driver_name'],)));

                      },
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        Driver[index]['Driver_name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            Driver[index]['From'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            Driver[index]['To'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      trailing: Text(
                        'view',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),

                )
                );


               /* Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Ravi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Street no.3 - lakeviewpark',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Busy',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 9876545676',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'kumar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        ' Street no6-KP Stadium',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Available',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 987654567',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Jayan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Mv Street - Airport',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Busy',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 987654567',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),*/

              }
            ),
          ),
        ),
      ],
    );
  }
}
