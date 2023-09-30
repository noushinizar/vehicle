import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/payment_success_page.dart';
import 'package:vehicle/widgets/background-image.dart';

class payment extends StatefulWidget {
  final double amount;

  const payment({super.key, required this.amount});


  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {

  String? payment;



  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(image: 'images/bgimage.jpg'),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Payment',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[600]),
                  child: Center(
                    child: Text(
                      'Booking Payment',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArchivoBlack',
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          border: Border.all(color: Colors.black54, width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'payment Details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.black54, width: 1)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  ' Amount',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(width: 120),
                                Text(
                                  '₹ ${widget.amount.toString()}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.black54, width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Total Payable Amount',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(width: 30),
                                Text(
                                  '₹ ${widget.amount.toString()}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.black54, width: 1),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  'PG Charge',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(width: 130),
                                Text(
                                  '₹ 0.00',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      RadioListTile(
                          title: Text(
                            'Credit Card',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          value: 'credit',
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                      RadioListTile(
                          title: Text(
                            'Debit Card',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          value: 'debit',
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                      RadioListTile(
                          title: Text(
                            'UPI',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          value: 'upi',
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                      RadioListTile(
                          title: Text(
                            'Net Banking',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          value: 'netBanking',
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value.toString();
                            });
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 4, left: 4),
                child: Container(
                  height: 45,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[600]),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(),
                          ));
                    },
                    child: Text(
                      'PAY',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);

    /*Container(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select payment method",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             CircleAvatar(radius: 40,
               backgroundImage: AssetImage('images/phonepay.png',),
             ),
             CircleAvatar(
               radius: 40,
               backgroundImage: AssetImage('images/gpay.jpg'),
             ),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/paytm.jpg'),
              )
            ],
          ),

        ],
      ),
    );*/
  }
}
