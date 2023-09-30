import 'package:flutter/material.dart';
import 'package:vehicle/utils.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.controller,
    this.suffixicon,
    this.obsecuretext,

    this.validate, required String? Function(dynamic valuePass) validator,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final controller;
  final suffixicon;
  final VoidCallback? validate;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final obsecuretext;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            validator:(validate){} ,
            controller: controller ,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
              suffixIcon: suffixicon,
            ),
            //obscureText: false,
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
            obscureText: obsecuretext,

          ),
        ),
      ),
    );
  }
}
