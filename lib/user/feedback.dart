import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/user/payment.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';
import 'package:intl/intl.dart';

class feedback extends StatelessWidget {
  feedback({Key? key}) : super(key: key);
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextInputField(
              icon: Icons.feedback_outlined,
              hint: 'Feedback',
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
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
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              buttonName: 'Submit',
              onpress: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ]),
        ),
      ),
    ]);
  }
}

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
