import 'package:flutter/material.dart';
import 'package:vehicle/user/Booking_page.dart';

class Vehicle extends StatelessWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Image.asset(
                      'images/Bike.png',
                      fit: BoxFit.fitHeight),
                  SizedBox(width: 10,),
                  Text('Bike', style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),),
                 SizedBox(width:60 ,),
                 Text('80\$', style: TextStyle(
                     color: Colors.red,
                     fontSize: 30,
                     fontWeight: FontWeight.bold),)
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Image.asset(
                      'images/Taxi.jpg',
                      fit: BoxFit.fitHeight),
                  SizedBox(width: 10,),
                  Text('Taxi', style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),),
                  SizedBox(width:60 ,),
                  Text('100\$', style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),)
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Image.asset(
                      'images/car.jpeg',
                      fit: BoxFit.fitHeight),
                  SizedBox(width: 10,),
                  Text('Car', style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),),
                  SizedBox(width:60 ,),
                  Text('150\$', style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),)
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
