import 'package:flutter/material.dart';

class Curstomtextformauth extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData iconData;
  TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  TextInputType type;
  Curstomtextformauth(
      {super.key,
      required this.hintText,
      required this.label,
      required this.iconData,
      required this.mycontroller,
      required this.validator, this.type=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
      child: TextFormField(
        keyboardType: type,
        validator: validator,
        controller: mycontroller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14),
            suffixIcon: Icon(iconData),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(label)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
