import 'package:flutter/material.dart';
import 'package:vehicle/user/Home.dart';


class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
              'Payment Successfull....!',
              style: TextStyle(fontSize: 25, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
