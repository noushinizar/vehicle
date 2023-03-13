import 'package:flutter/material.dart';
import 'package:vehicle/widgets/Dialogbox.dart';
import 'package:vehicle/widgets/background-image.dart';
class viewuser extends StatelessWidget {
  const viewuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              ' User',
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
                        'Mariya',
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
                        'Onride',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'user');
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
                            'Address- abcd(h),2nd street,mumbai',
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
                        'Ram',
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
                        'Waiting',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'user');
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
                            'Address- abcd(h),2nd street,mumbai',
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
                        'Raya',
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
                        'Onride',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'user');
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
                            'Address- abcd(h),2nd street,mumbai',
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
                        'Advik',
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
                        'Waiting',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      children: [
                        ListTile(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertBox(text: 'user');
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
                            'Address- abcd(h),2nd street,mumbai',
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
