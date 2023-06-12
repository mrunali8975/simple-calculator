import 'package:flutter/material.dart';

class OperationButton extends StatefulWidget {
  final String title;
  final Widget icon;
  final void Function(String string) onPressed;
  const OperationButton(this.title, this.icon,this.onPressed, {super.key,}) ;


  @override
  State<OperationButton> createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> {
  // final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton.icon(
        icon: widget.icon,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.purple,
          padding: EdgeInsets.all(15),
          // maximumSize: Size(5, 5)
        ),
        onPressed:(){widget.onPressed(widget.title);},
       label:Text(widget.title),
      ),
    );
  }
}
