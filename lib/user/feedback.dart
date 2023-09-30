import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/user/payment.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';
import 'package:intl/intl.dart';

class feedback extends StatefulWidget {
  feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  TextEditingController feedbackcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  String user_id ="";
  late SharedPreferences local;

  List complaints=[];

  Addfeedback()async{
    local= await SharedPreferences.getInstance();
    user_id=(local.getString('user_id')?? '');
    print('user_id ${user_id}');

    var data ={
      "Feedback": feedbackcontroller.text,
      "Date": datecontroller.text,
      "Time": timecontroller.text,
      "User_id": user_id.replaceAll('"', ''),
    };
    print(data);

    var res = await Api().authData(data, 'feedback/');
    var body = json.decode(res.body);
    print(body);
    if(body['success']== true)
    {
      local.setString('user_id', user_id.toString());
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(context,
          MaterialPageRoute (builder: (context)
          {
            return Home();
          }));
    }
    else
    {
      Fluttertoast.showToast(msg: body['message'].toString(),
          backgroundColor: Colors.grey
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(
        image: 'images/bgimage.jpg',
      ),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Feedbacks',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            TextInputField(
              controller: feedbackcontroller,
              icon: Icons.feedback_outlined,
              hint: 'Feedback',
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Feedback';
                  } else {
                    return null;
                  }
                }
            ),
            TextInputField(
              controller: datecontroller,
              ontap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  datecontroller.text =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                }
              },
              icon: Icons.date_range,
              hint: 'Date',
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Select date';
                  } else {
                    return null;
                  }
                }
            ),
            TextInputField(
              controller: timecontroller,
              ontap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (pickedTime != null) {
                 DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());

                 String formattedTime =
                      DateFormat('HH:mm:ss').format(parsedTime);
                timecontroller.text =
                      formattedTime;

                } else {
                  print("Time is not selected");
                }
              },
              icon: Icons.timer,
              hint: 'Time',
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Select Time';
                  } else {
                    return null;
                  }
                }
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              buttonName: 'Submit',
              onpress: () {
                Addfeedback();
              },
            ),
          ]),
        ),
      ),
    ]);
  }
}

/*
void bottomSheets(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: payment(),
    ),
  );
}
*/
