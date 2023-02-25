import 'package:flutter/material.dart';
import 'package:vehicle/Admin/Feedback_list.dart';
import 'package:vehicle/driver/BookingList.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          BackgroundImage(
            image: 'images/bgimage.jpg',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 RoundedButton(buttonName: 'Manage Driver',onpress: (){
                     showDialog(context: context, builder: (context){
                       return AlertBox(text: 'Driver');
                     });
                 },),
                  SizedBox(height: 10,),
                  RoundedButton(buttonName: 'Manage User',onpress: (){
                    showDialog(context: context, builder: (context){
                      return AlertBox(text: 'User');
                    });
                  },),
                  SizedBox(height: 10,),
                  RoundedButton(buttonName: 'Manage Feedback',onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackList()));
                  },),
                  SizedBox(height: 10,),
                  RoundedButton(buttonName: 'Manage Vehicle',onpress: (){
                    showDialog(context: context, builder: (context){
                      return AlertBox(text: 'Vehicle');
                    });
                  },),
                  SizedBox(height: 10,),
                  RoundedButton(buttonName: 'Manage booking',onpress: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingList()));
                  },),
                  SizedBox(height: 10,),
                  RoundedButton(buttonName: 'Manage Rental',onpress: (){
                    showDialog(context: context, builder: (context){
                      return AlertBox(text: 'Rental');
                    });
                  },),
                ],
              ),
            )

          ),
        ]);
  }
  }

