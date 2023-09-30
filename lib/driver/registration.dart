import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vehicle/driver/Driver_home.dart';
import 'package:vehicle/screens/login-screen.dart';
import 'package:vehicle/utils.dart';
import '../Api_service/Api.dart';
import '../widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController expecontroller = TextEditingController();
  TextEditingController licensecontroller = TextEditingController();
  TextEditingController fromcontroller = TextEditingController();
  TextEditingController Tocontroller = TextEditingController();
 TextEditingController Usernamecontroller =TextEditingController();
  TextEditingController agecontroller =TextEditingController();
  TextEditingController vegcontroller =TextEditingController();
  TextEditingController hobbycontroller =TextEditingController();
  TextEditingController gendercontroller =TextEditingController();
  TextEditingController amountcontroller =TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
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
                          }
                      ),
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
                          }
                      ),
                      PasswordInput(
                        controller: passcontroller,
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        obsecuretext: _obscureText,
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
                          }else if(valuePass.length<6){
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
                        validator: (valueConPass) {
                          if (valueConPass!.isEmpty) {
                            return 'Please confirm your Password';
                          } else if (valueConPass.length<6) {
                            return 'Please check your Password';
                          }else if (valueConPass == passcontroller){
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
                          }
                      ),
                      TextInputField(
                        controller: phonecontroller,
                        icon:Icons.phone,
                        hint: 'Phone no.',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        validator: (valuephone) {
                          if (valuephone!.isEmpty) {
                            return 'Please enter Mobile Number';
                          }
                          RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
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
                          icon: Icons.work,
                          hint: 'Amount/day',
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (valueName) {
                            if (valueName!.isEmpty) {
                              return 'Please Enter Amount/day';
                            } else {
                              return null;
                            }
                          }
                      ),
                      TextInputField(
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

                      ),
                      TextInputField(
                          controller: fromcontroller,
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
                      ),TextInputField(
                          controller: gendercontroller,
                          icon: Icons.person_pin_circle_outlined,
                          hint: 'gender',
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
                          controller: agecontroller,
                          icon: Icons.bar_chart,
                          hint: 'age',
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
                          controller: vegcontroller,
                          icon: Icons.fastfood_outlined,
                          hint: 'Veg/non',
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
                          controller: hobbycontroller,
                          icon: Icons.nightlife,
                          hint: 'Hobby',
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
                                  context, MaterialPageRoute(builder: (context) =>LoginScreen()));
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
      "Username": Usernamecontroller.text,
      "Driver_name": namecontroller.text,
      "Email": emailcontroller.text,
      "Phone": phonecontroller.text,
      "Address": addresscontroller.text,
      "Password": passcontroller.text,
      "Experience":expecontroller.text,
      "License_no":licensecontroller.text,
      "From": fromcontroller.text,
      "To":Tocontroller.text,
      "Gender":gendercontroller.text,
      "Veg_or_non":vegcontroller.text,
      "Hobby":hobbycontroller.text,
      "Age":agecontroller.text,
      "Amount":amountcontroller.text

    };
    print(data);
    var res = await Api().authData(data, 'driver/register');
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
