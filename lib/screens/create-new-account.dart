import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/screens/login-screen.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/utils.dart';
import '../widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController Usernamecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
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
                          }),
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
                          }),
                      PasswordInput(
                        obsecuretext: _obscureText,
                        controller: passcontroller,
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.next,
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
                      PasswordInput(
                        obsecuretext: _obscureText,
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.next,
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
                        validator: (valueConPass) {
                          if (valueConPass!.isEmpty) {
                            return 'Please confirm your Password';
                          } else if (valueConPass.length < 6) {
                            return 'Please check your Password';
                          } else if (valueConPass == passcontroller) {
                            return null;
                          }
                        },
                      ),
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
                          }),
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
                          RegExp number =
                              new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                          if (number.hasMatch(valuephone)) {
                            return null;
                          } else {
                            return 'Invalid Mobile Number';
                          }
                        },
                      ),
                      TextInputField(
                          controller: locationcontroller,
                          icon: Icons.location_on_outlined,
                          hint: 'Location',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter your location';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(
                        onpress: (){
                          Registerdata();
                        },
                          buttonName: 'Register'),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Login',
                              style: kBodyText.copyWith(
                                  color: kBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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

  void Registerdata() async {
    var data = {
      "Username":Usernamecontroller.text,
      "Name": namecontroller.text,
      "Email": emailcontroller.text,
      "Phone": phonecontroller.text,
      "Address": addresscontroller.text,
      "Password": passcontroller.text,
      "Location": locationcontroller.text,
    };

    var res = await Api().authData(data, 'user/register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    } else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }
}
