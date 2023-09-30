import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle/screens/login-screen.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/utils.dart';
import '../Api_service/Api.dart';
import '../widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  bool _obscureText = true;
  late String loginid;
  String name = "";
  String address = "";
  String phn = "";
  String email = "";
  String username = "";
  String location = "";
  late SharedPreferences local;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _viewPro();
  }

  Future<void> _viewPro() async {
    local = await SharedPreferences.getInstance();
    loginid = (local.getString('login_id') ?? '');
    print('login_id${loginid}');
    var res = await Api()
        .getData('user/view-user-profile/' + loginid.replaceAll('"', ''));
    var body = json.decode(res.body);
    print("body${body}");

    setState(() {
      name = body['data'][0]['Name'];
      print(name);
      address = body['data'][0]['Address'];
      phn = body['data'][0]['Phone'];
      email = body['data'][0]['Email'];
      location= body['data'][0]['Location'];

      namecontroller.text = name;
      addresscontroller.text = address;
      phonecontroller.text = phn;
      emailcontroller.text = email;
      locationcontroller.text=location;
    });
  }

  _update() async {
    local = await SharedPreferences.getInstance();
    loginid = (local.getString('login_id') ?? '');
    print('login_id${loginid}');
    setState(() {
      var _isLoading = true;
    });

    var data = {
      "Name": namecontroller.text.trim(),
      "Address": addresscontroller.text.trim(),
      "Email": emailcontroller.text.trim(),
      "Phone": phonecontroller.text.trim(),
      "Location":locationcontroller.text.trim(),
     // "login_id": loginid.replaceAll('"', '')
    };
    print(data);
    var res = await Api().authData(data, 'user/update-user-profile/'+loginid.replaceAll('"', ''));
    var body = json.decode(res.body);

    if (res.statusCode==200) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
        IconButton(
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        icon: Icon(Icons.logout,color: Colors.white,)),

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
                     /* PasswordInput(
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
                          }else if(valuePass.length<6){
                            return 'Password too short';
                          } else {
                            return null;
                          }
                        },
                      ),*/
                     /* PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.next,

                        validator: (valueConPass) {
                          if (valueConPass!.isEmpty) {
                            return 'Please confirm your Password';
                          } else if (valueConPass.length<6) {
                            return 'Please check your Password';
                          }else if (valueConPass == passcontroller){
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
                          RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter location';
                            } else {
                              return null;
                            }
                          }
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(buttonName: 'Save Changes',
                      onpress: (){
                        _update();
                        /*Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>Home()));*/
                      },),
                      SizedBox(
                        height: 30,
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
}
