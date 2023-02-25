import 'package:flutter/material.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
class FeedbackList extends StatelessWidget {
  const FeedbackList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children:[
          BackgroundImage(image: 'images/bgimage.jpg'),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                'Feedbacks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.feedback_outlined,color: Colors.black,),
                      title: Text('good',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                      trailing: Text('2/2/2023 \n 2.30 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.feedback_outlined,color: Colors.black,),
                      title: Text('good',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                      trailing: Text('1/2/2023 \n 4.30 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.feedback_outlined,color: Colors.black,),
                      title: Text('Nice ride',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                      trailing: Text('1/2/2023 \n 11.30 am',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.feedback_outlined,color: Colors.black,),
                      title: Text('verygood',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
                      trailing: Text('1/2/2023 \n 2.30 pm',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
