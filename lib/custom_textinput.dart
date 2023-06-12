import 'package:flutter/material.dart';
class CustomInput extends StatefulWidget {
  const CustomInput({Key? key,required this.title, required this.num1});
  final String title;
  final TextEditingController num1;
  // final TextEditingController num2 ;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Expanded(
      child: TextField(
        controller: widget.num1,
        style: TextStyle(color: Colors.red,fontSize: 22 ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText:widget.title,
            hintText: widget.title,
            hintStyle: TextStyle(color: Colors.red,fontSize: 15),
            labelStyle: TextStyle(color: Colors.red)
        ),),
    ),);
  }
}
