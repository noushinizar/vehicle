import 'package:flutter/material.dart';
import 'package:vehicle/user/vBooking_page.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
class vehicle_details extends StatefulWidget {

  final String vmodel;
  final String image;
  final String amount;
  final String fuel;
  final String mailage;
  final String modelyear;

  const vehicle_details({super.key, required this.vmodel,  required this.amount, required this.fuel, required this.mailage, required this.modelyear, required this.image});

  @override
  State<vehicle_details> createState() => _vehicle_detailsState();
}

class _vehicle_detailsState extends State<vehicle_details> {

  @override
  Widget build(BuildContext context) {
    return
      Stack(
          children: [
          BackgroundImage(image: 'images/bgimage.jpg'),

    Scaffold(

    backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,)),
      ),
      body:Card(

        margin: EdgeInsets.all(45),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image:AssetImage('know_your_ride_backend/public/images/'+widget.image),
                fit:BoxFit.cover ,),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("5%  ",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green)),
                  Expanded(
                      flex: 2,
                      child: Text("discount is available if you rent for 10 days or more",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(' Vehicle_model  :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                  Text(widget.vmodel,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(' Amound  :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                  Text('${widget.amount}/day',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(' Milage  :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                  Text(widget.mailage,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(' model_year  :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                  Text(widget.modelyear,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),)
                ],
              ),
              SizedBox(height: 40,),
              RoundedButton(
                buttonName: 'Book',
                onpress: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage(amount:double.parse(widget.amount) ,

                  )));
                },
              ),
            ],
          ),
        ),
      ) ,
    )
    ]
    );
  }
}
