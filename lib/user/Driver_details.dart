import 'package:flutter/material.dart';
import 'package:vehicle/user/D_booking.dart';
import 'package:vehicle/user/vBooking_page.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
class D_details extends StatefulWidget {
  final String amount;
  final String phone;
  final String liceno;
  final String age;
  final String gender;
  final String vegornon;
  final String hobby;
  final String name;

  const D_details({super.key, required this.amount, required this.phone, required this.liceno, required this.age, required this.gender, required this.vegornon, required this.hobby, required this.name});

  @override
  State<D_details> createState() => _D_detailsState();
}

class _D_detailsState extends State<D_details> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          BackgroundImage(image: 'images/bgimage.jpg'),

          Scaffold(

            backgroundColor: Colors.transparent,

            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back,)),
            ),
            body: Card(

              margin: EdgeInsets.all(45),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* Image(image:AssetImage('images/'+widget.image),
                      fit:BoxFit.cover ,),
                    SizedBox(height: 30,),*/
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5%  ",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green)),
                        Expanded(
                            flex: 2,
                            child: Text("discount is available if you rent for 10 days or more",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                      ],
                    ),*/
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Amount/day  :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.amount, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Phone no   :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text('${widget.phone}', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Licence no  :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.liceno, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Age  :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.age, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Gender  :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.gender, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Veg/non   :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.vegornon, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(' Hobby   :', style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),),
                        Text(widget.hobby, style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),)
                      ],
                    ),

                    SizedBox(height: 40,),
                    RoundedButton(
                      buttonName: 'Book',
                      onpress: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>
                            Dbooking(amount: double.parse(widget.amount),

                            )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
    );

  }
}

// children:[
// ListTile(
//
// title: Container(
// alignment: Alignment.centerLeft,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
//
// children:[
// Text(
// 'Amount/day :   ${Driver[index]['Amount']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(height: 10,),
// Text(
// 'Phone no :     ${Driver[index]['Phone']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// SizedBox(height: 10,),
// Text('Licence no :     ${ Driver[index]['License_no']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// SizedBox(height: 10,),
// Text(
// 'Age :     ${Driver[index]['Age']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// SizedBox(height: 10,),
// Text(
// 'Gender :      ${Driver[index]['Gender']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// SizedBox(height: 10,),
// Text(
// 'Veg/non :     ${Driver[index]['Veg_or_non']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// SizedBox(height: 10,),
// Text(
// 'Hobby :     ${Driver[index]['Hobby']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// ] ),
// ),
//
// subtitle: Padding(
// padding: const EdgeInsets.only(top: 20.0),
// child: Center(child: Text("Book",style:TextStyle(
// color: Colors.green,
// //  backgroundColor: Colors.black,
// fontSize: 30,
// fontWeight: FontWeight.w400))),
// ),
// ),
// ]),
//
// );