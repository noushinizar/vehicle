import 'package:flutter/material.dart';
class AlertBox extends StatelessWidget {
  final String text;

  const AlertBox({ required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text(text,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,)),

      actions: [
        ElevatedButton(
          onPressed: (){}, child: Text('Aceept'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
        ElevatedButton(onPressed: (){}, child: Text('Reject'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}