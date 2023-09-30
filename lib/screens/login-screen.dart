import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Admin/Admin_home.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/driver/Driver_home.dart';
import 'package:vehicle/driver/registration.dart';
import 'package:vehicle/register_dashbord.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/user/vehicle.dart';
import 'package:vehicle/utils.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final String user = "1";
  String driver = "2";
  String storedvalue = "1";

  late SharedPreferences local;
  String login_id = "";
  String driver_id = "";
  String user_id = "";
  String role = "";
  String status = "";

  bool isloading = false;
  TextEditingController Usernamecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'images/bgimage.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'HELLO!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                      controller: Usernamecontroller,
                      icon: FontAwesomeIcons.user,
                      hint: 'Username',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      validator: (valueName) {
                        if (valueName!.isEmpty) {
                          return 'Please Enter Username';
                        } else {
                          return null;
                        }
                      }),
                  PasswordInput(
                    obsecuretext: _obscureText,
                    controller: passcontroller,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    suffixicon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: (valuePass) {
                      if (valuePass!.isEmpty) {
                        return 'Please enter your Password';
                      } else if (valuePass.length < 6) {
                        return 'Password too short';
                      } else {
                        return null;
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                    onpress: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      Logindata();
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainDash())),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }

  Logindata() async {
    setState(() {
      isloading = true;
    });
    var data = {
      "Username": Usernamecontroller.text,
      "Password": passcontroller.text,
    };
    print(data);
    var res = await Api().authData(data, 'login');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);
      role = json.encode(body['Role']);
      status = json.encode(body['Status']);
      login_id = json.encode(body['login_id']);
      driver_id = json.encode(body['driver_id']);
      user_id = json.encode(body['user_id']);
      local = await SharedPreferences.getInstance();
      local.setString('Role', role.toString());
      local.setString('login_id', login_id.toString());
      local.setString('driver_id', driver_id.toString());
      local.setString('user_id', user_id.toString());
      print('user${user}');
      print('role${role}');
      print('storedvalue${storedvalue}');
      print('Status${status}');
      print('loginid${login_id}');
      print('userid${user_id}');
      print('driver_id${driver_id}');
      if (user == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else if (driver == role.replaceAll('"', '') &&
          storedvalue == status.replaceAll('"', '')) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DriverHome()));
      } else {
        Fluttertoast.showToast(
            msg: body['message'].toString(), backgroundColor: Colors.grey);
      }
    } else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }
}
