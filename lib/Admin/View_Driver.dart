import 'package:flutter/material.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
class viewdriver extends StatelessWidget {
  const viewdriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              ' Driver',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Jhone',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'MG Road - Airport',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Available',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 987654567',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Ravi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Street no.3 - lakeviewpark',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Busy',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 9876545676',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'kumar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        ' Street no6-KP Stadium',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Available',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 987654567',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
                Card(
                  child: ExpansionTile(
                      leading: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Jayan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Mv Street - Airport',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        'Busy',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'Confirm booking');
                            });
                          },
                          title: Text(
                            'Mobail - 987654567',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text(
                            'Licence no.  23805764022',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
