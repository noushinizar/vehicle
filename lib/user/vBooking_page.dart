import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/feedback.dart';
import 'package:vehicle/user/find_driver.dart';
import 'package:vehicle/user/payment.dart';
import 'package:vehicle/utils.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';

import '../utils.dart';
import '../utils.dart';
import '../widgets/background-image.dart';

class BookingPage extends StatefulWidget {
  final double amount;

  const BookingPage({super.key, required this.amount});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
@override
 void initState() {
    // TODO: implement initState
    super.initState();
    fromdatecontroller.addListener(calculatePayableAmount);
    todatecontroller.addListener(calculatePayableAmount);
  }

  TextEditingController fromdatecontroller = TextEditingController();
  TextEditingController todatecontroller = TextEditingController();
  //TextEditingController placecontroller = TextEditingController();
  //TextEditingController desticontroller = TextEditingController();
  String numdays="";
  double finalamount=0.00;
  String user_id ="";
  String Vehicle_id="";
  late SharedPreferences local;


 // List booking=[];

  Addbooking()async{
    local= await SharedPreferences.getInstance();
    /*local.setString('user_id', user_id.toString());
    local.setString('_id', Vehicle_id.toString());*/
    user_id=(local.getString('user_id')?? '');
    Vehicle_id=(local.getString('vehicle_id')?? '');
    print('user_id ${user_id}');
    print('vehicle_id${Vehicle_id}');

    var data ={
      //  "Place" : placecontroller.text,
      // "Destination":desticontroller.text,
      // "Time":timecontroller.text,
      // "Date":datecontroller.text,

      "To_date":todatecontroller.text,
      "From_date":fromdatecontroller.text,
      "Vehicle_id":Vehicle_id.replaceAll('"', ''),
      "User_id": user_id.replaceAll('"', ''),
      "amount":finalamount.toString(),
    };
    print(data);
    var res = await Api().authData(data, 'rent/rent-vehicle');
    var body = json.decode(res.body);
    print(body);

    if(body['success']== true)
    {
      local.setString('user_id', user_id.toString());
    //  local.setString('_id', user_id.toString());
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(context,
          MaterialPageRoute (builder: (context)
          {
            return payment(amount: finalamount,);
          }));
    }
    else
    {
      Fluttertoast.showToast(msg: body['message'].toString(),
          backgroundColor: Colors.grey
      );

    }

  }
 /* calculatedays(){
   // Get the date values from the text editing controllers
   final date1Text = fromdatecontroller.text;
   final date2Text = todatecontroller.text;

   // Parse the date strings into DateTime objects
   final date1 = DateTime.parse(date1Text);
   final date2 = DateTime.parse(date2Text);

   // Calculate the time difference
   final timeDifference = date2.difference(date1);

   // Extract the number of days
   numdays = timeDifference.inDays as String;
   print(numdays);
 }
  amount(){
    if(numdays == 10){
      finalamount= double.parse( widget.amount) -(double.parse (widget.amount )* (0.05));
      print(finalamount);
    }
 }
*/

void calculatePayableAmount() {
  // Get the date values from the text editing controllers
  final date1Text = fromdatecontroller.text;
  final date2Text = todatecontroller.text;

  // Parse the date strings into DateTime objects
  final date1 = DateTime.tryParse(date1Text);
  final date2 = DateTime.tryParse(date2Text);

  if (date1 == null || date2 == null) {
    // Invalid date format, handle accordingly
    return;
  }

  // Calculate the number of days between the dates
  final timeDifference = date2.difference(date1);
  final numDays = timeDifference.inDays;


  // Calculate the payable amount
   double originalAmount = widget.amount ; // Assuming original amount is $100
   finalamount = originalAmount * numDays;
  if (numDays >= 10) {
    final discount = finalamount * 0.05;
    finalamount = finalamount - discount;
  }

  // Force a re-render of the UI to display the updated value
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    setState(() {});
  });
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
              'Bookings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               /* TextInputField(
                    icon: Icons.location_on,
                    hint: 'Place',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter place';
                      } else {
                        return null;
                      }
                    }),
                TextInputField(
                    icon: Icons.location_on_outlined,
                    hint: 'Destination',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter Destination';
                      } else {
                        return null;
                      }
                    }),*/
                TextInputField(
                  controller:fromdatecontroller,
                  ontap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      fromdatecontroller.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                  icon: Icons.date_range,
                  hint: 'From_Date',
                  inputType: TextInputType.number,
                  inputAction: TextInputAction.next,
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please select Date';
                      } else {
                        return null;
                      }
                    }
                ),
                TextInputField(
                    controller: todatecontroller,
                    ontap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        todatecontroller.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      }
                    },
                    icon: Icons.date_range,
                    hint: 'To_Date',
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please select Date';
                      } else {
                        return null;
                      }
                    }
                ),
              /*  TextInputField(
                  controller: timecontroller,
                  ontap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (pickedTime != null) {
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());

                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      timecontroller.text = formattedTime;
                    } else {
                      print("Time is not selected");
                    }
                  },
                  icon: Icons.timer,
                  hint: 'Time',
                  inputType: TextInputType.number,
                  inputAction: TextInputAction.next,
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please select Time';
                      } else {
                        return null;
                      }
                    }
                ),*/
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                  buttonName: 'Pay',
                  onpress: () {
                    Addbooking();
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>payment()));
                  },
                ),
                SizedBox(
                  height: 30,
                ),
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>payment()));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kBlue),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  *//*  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FindDriver()));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kBlue),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Find Driver',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),*//*
                    *//*ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => feedback()));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kBlue),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Feedbacks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),*//*
                  ],
                )*/
              ],
            ),
          ),
        )
      ],
    );
  }
}
