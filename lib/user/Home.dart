import 'package:flutter/material.dart';
import 'package:vehicle/Admin/Rental.dart';
import 'package:vehicle/screens/create-new-account.dart';
import 'package:vehicle/user/Edit_Profile.dart';
import 'package:vehicle/user/vehicle.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          BackgroundImage(
            image: 'images/bgimage.jpg',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>EditProfile()));
                },
                    icon: Icon(Icons.account_circle_outlined),
                    iconSize: 40),
              ],
              title: Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    buttonName: "Select Vehicle",
                    onpress: () {
                      bottomSheets(context);
                    },
                  ),
                  SizedBox(height: 20,),
                  RoundedButton(
                    buttonName: "Rental details",
                    onpress: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>Rental()));
                    },
                  ),
                ],
              ),

            ),
          ),
        ]);
  }

}
void bottomSheets(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context)
        => Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Vehicle(),
        ),
      );
}

