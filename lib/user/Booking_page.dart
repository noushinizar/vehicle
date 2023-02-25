import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vehicle/user/feedback.dart';
import 'package:vehicle/user/find_driver.dart';
import 'package:vehicle/utils.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';

import '../utils.dart';
import '../utils.dart';
import '../widgets/background-image.dart';

class BookingPage extends StatelessWidget {
 BookingPage({Key? key}) : super(key: key);

  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

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
                TextInputField(
                  icon: Icons.location_on,
                  hint: 'Place',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                TextInputField(
                  icon: Icons.location_on_outlined,
                  hint: 'Destination',
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
                SizedBox(height: 30,),
                RoundedButton(
                  buttonName: 'Submit',
                  onpress: (){

                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        bottomSheets(context);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kBlue),
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FindDriver()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor:kBlue),
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
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kBlue),
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
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
