import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/driver/Driver_home.dart';
import 'package:vehicle/screens/login-screen.dart';
import 'package:vehicle/utils.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/password-input.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController expecontroller = TextEditingController();
  TextEditingController licensecontroller = TextEditingController();
  TextEditingController fromcontroller = TextEditingController();
  TextEditingController Tocontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  bool _obscureText = true;
   String loginid="";
  String name = "";
  String address = "";
  String phn = "";
  String email = "";
  String username = "";
  String from = "";
  String to = "";
  String licence="";
  String exp="";
  String amt="";

  late SharedPreferences local;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _viewPro();
  }

  Future<void> _viewPro() async {
    local = await SharedPreferences.getInstance();
    loginid=(local.getString('login_id')?? '');
    print('login_id${loginid}');
    var res = await Api()
        .getData('driver/view-driver-profile/' + loginid.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data'][0]['Driver_name'];
      print(name);
      address = body['data'][0]['Address'];
      phn = body['data'][0]['Phone'];
      email = body['data'][0]['Email'];
      from= body['data'][0]['From'];
      to=body['data'][0]['To'];
      exp=body['data'][0]['Experience'];
      amt=body['data'][0]['Amount'];


      namecontroller.text = name;
      addresscontroller.text = address;
      phonecontroller.text = phn;
      emailcontroller.text = email;
      fromcontroller.text=from;
      Tocontroller.text=to;
      expecontroller.text=exp;
      amountcontroller.text=amt.toString();

      //locationcontroller.text=location;
    });
  }

  _update() async {
    local = await SharedPreferences.getInstance();
    loginid = (local.getString('login_id') ?? '');
    print('login_id ${loginid}');
    setState(() {
      var _isLoading = true;
    });

    var data = {

      "Driver_name": namecontroller.text,
      "Email": emailcontroller.text,
      "Phone": phonecontroller.text,
      "Address": addresscontroller.text,
      "Experience":expecontroller.text,
      "From": fromcontroller.text,
      "To":Tocontroller.text,
      "Amount":amountcontroller.text
    };
    print(data);
    var res = await Api().authData(data, 'driver/update-driver-profile/'+loginid.replaceAll('"', ''));
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DriverHome()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }, icon: Icon(Icons.logout,color: Colors.white,)),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.grey[400]!.withOpacity(
                                0.4,
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: kWhite,
                                size: size.width * 0.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.08,
                        left: size.width * 0.56,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: kBlue,
                            shape: BoxShape.circle,
                            border: Border.all(color: kWhite, width: 2),
                          ),
                          child: Icon(
                            FontAwesomeIcons.arrowUp,
                            color: kWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      TextInputField(
                          controller: namecontroller,
                          icon: FontAwesomeIcons.user,
                          hint: 'Name',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter Name';
                            } else {
                              return null;
                            }
                          }
                      ),
                      TextInputField(
                          controller: emailcontroller,
                          icon: FontAwesomeIcons.envelope,
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          validator: (valueMail) {
                            if (valueMail!.isEmpty) {
                              return 'Please enter Email Id';
                            }
                            RegExp email = new RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (email.hasMatch(valueMail)) {
                              return null;
                            } else {
                              return 'Invalid Email Id';
                            }
                          }
                      ),
               /*       PasswordInput(
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
                      ),*/
                      /*PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        validator: (valueConPass) {
                          if (valueConPass!.isEmpty) {
                            return 'Please confirm your Password';
                          } else if (valueConPass.length < 6) {
                            return 'Please check your Password';
                          } else if (valueConPass == passcontroller) {
                            return null;
                          }
                        },
                      ),*/
                      TextInputField(
                          controller: addresscontroller,
                          icon: FontAwesomeIcons.addressBook,
                          hint: 'Address',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueAddress) {
                            if (valueAddress!.isEmpty) {
                              return 'Please Enter Address';
                            } else {
                              return null;
                            }
                          }
                      ),
                      TextInputField(
                        controller: phonecontroller,
                        icon: Icons.phone,
                        hint: 'Phone no.',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        validator: (valuephone) {
                          if (valuephone!.isEmpty) {
                            return 'Please enter Mobile Number';
                          }
                          RegExp number = new RegExp(
                              r'(^(?:[+0]9)?[0-9]{10,12}$)');
                          if (number.hasMatch(valuephone)) {
                            return null;
                          } else {
                            return 'Invalid Mobile Number';
                          }
                        },
                      ),
                      TextInputField(
                          controller: expecontroller,
                          icon: Icons.work,
                          hint: 'Experience',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter Experience';
                            } else {
                              return null;
                            }
                          }
                      ),
                      TextInputField(
                          controller: amountcontroller,
                          icon: Icons.currency_rupee,
                          hint: 'Amount/day',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueAddress) {
                            if (valueAddress!.isEmpty) {
                              return 'Please Enter amount/day';
                            } else {
                              return null;
                            }
                          }
                      ),
                   /*   TextInputField(
                        controller: licensecontroller,
                        icon: FontAwesomeIcons.creditCard,
                        hint: 'License no.',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter License number';
                          }
                          RegExp number = new RegExp(
                              r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$');
                          if (number.hasMatch(value)) {
                            return null;
                          } else {
                            return 'Invalid License number';
                          }
                        },

                      ),*/
                      TextInputField(
                          controller:fromcontroller ,
                          icon: Icons.location_on,
                          hint: 'From',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter location';
                            } else {
                              return null;
                            }
                          }
                      ),
                      TextInputField(
                          controller: Tocontroller,
                          icon: Icons.location_on_outlined,
                          hint: 'To',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter location';
                            } else {
                              return null;
                            }
                          }
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(buttonName: 'Save changes',
                          onpress: () {
                            _update();
                          }
                      ),
                      SizedBox(
                        height: 30,
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}