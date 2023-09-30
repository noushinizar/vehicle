import 'package:flutter/material.dart';
import 'package:vehicle/user/Home.dart';
class cancel_page extends StatefulWidget {
  const cancel_page({Key? key}) : super(key: key);

  @override
  State<cancel_page> createState() => _cancel_pageState();
}

class _cancel_pageState extends State<cancel_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: double.maxFinite,
        color: Colors.black,
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            },
            child: Text(
              'BACK HOME',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green[700],
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Booking Canceled....!',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'the amount payed by you will be refunded with in 4 working days',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
