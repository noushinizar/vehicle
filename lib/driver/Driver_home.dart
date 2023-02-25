import 'package:flutter/material.dart';
import 'package:vehicle/driver/BookingList.dart';
import 'package:vehicle/driver/registration.dart';
import 'package:vehicle/driver/update_profile.dart';
import 'package:vehicle/user/Edit_Profile.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

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
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>profile()));
                }, icon: Icon(Icons.account_circle_outlined),iconSize: 40,)
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
              child: RoundedButton(
                buttonName: "view bookings",
                onpress: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Vehicle()));
                  bottomSheets(context);
                },
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
      child: BookingList(),
    ),
  );
}


