import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
