import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/driver/Driver_home.dart';
import 'package:vehicle/user/Home.dart';

import '../Api_service/Api.dart';
class AlertBox extends StatefulWidget {
  final String text;

  const AlertBox({ required this.text});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  String booking_id="";
  late SharedPreferences local;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text(widget.text, textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,)),

      actions: [
        ElevatedButton(
          onPressed: () {
       _Accept(booking_id);

          }, child: Text('Aceept'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
        ElevatedButton(onPressed: () {
          _Reject(booking_id);
        }, child: Text('Reject'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actionsAlignment: MainAxisAlignment.center,
    );
  }


  _Accept(String id) async {
    local = await SharedPreferences.getInstance();
    booking_id = (local.getString('_id') ?? '');
    print('booking_id ${booking_id}');
    setState(() {
      var _isLoading = true;
    });

    var data = {"_id": booking_id};
    print(data);
    var res = await Api()
        .getData(
        'booking/driver-accept-booking/' + booking_id.replaceAll('"', ''));
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print("body of res${body}");

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DriverHome()));
      print(body['message']);
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }


    _Reject(String id) async {
      local= await SharedPreferences.getInstance();
      booking_id=(local.getString('_id')?? '');
      print('booking_id ${booking_id}');
      setState(() {
        var _isLoading = true;
      });

      var data = {"_id": booking_id};
      print(data);
      var res = await Api()
          .getData('booking/driver-reject-booking/' +  booking_id.replaceAll('"', ''));
      var body = json.decode(res.body);

      if (body['success'] == true) {
        print("body of res${body}");

        Fluttertoast.showToast(
          msg: body['message'].toString(),
          backgroundColor: Colors.grey,
        );

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DriverHome()));
        print(body['message']);
      } else {
        Fluttertoast.showToast(
          msg: body['message'].toString(),
          backgroundColor: Colors.grey,
        );
      }
    }
  }
