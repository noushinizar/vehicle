import 'package:flutter/material.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';

class viewVehicle extends StatelessWidget {
  const viewVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(image: 'images/bgimage.jpg'),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Vehicles',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertBox(text: 'Rental');
                        });
                  }, //=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/Bike.png', fit: BoxFit.fitHeight),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Bike',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          /* Text('80\$', style: TextStyle(
                       color: Colors.red,
                       fontSize: 30,
                       fontWeight: FontWeight.bold),)*/
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertBox(text: 'Rental');
                        });
                  },
                  //=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/Taxi.jpg', fit: BoxFit.fitHeight),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Taxi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),

                          /*Text('100\$', style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),)*/
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertBox(text: 'Rental');
                        });
                  },
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage())),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/car.jpeg', fit: BoxFit.fitHeight),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Car',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          /* Text('150\$', style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),)*/
                        ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ]);
  }
}
