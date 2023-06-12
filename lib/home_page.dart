import 'package:demolearn/operation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:demolearn/operation_buttons.dart';
import 'package:demolearn/custom_textinput.dart';
import 'package:demolearn/operations_clss.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
  late String result='';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController num1 = TextEditingController();

  final TextEditingController num2 = TextEditingController();
  final operations = Operations();


  void getNum(String op) {
    double res = 0.0;
    switch (op) {
      case 'Add':
        {
          // statements;
          res =
              operations.add(double.parse(num1.text), double.parse(num2.text));
        }
        break;

      case 'Substract':
        {
          res =
              operations.sub(double.parse(num1.text), double.parse(num2.text));
        }
        break;
      case 'Multiply':
        {
          res =
              operations.mul(double.parse(num1.text), double.parse(num2.text));
        }
        break;
      case 'Percentage':
        {
          res =
              operations.div(double.parse(num1.text), double.parse(num2.text));
        }
        break;
    }
    setState(() {
      widget.result = res.toString();
    });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        // margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.redAccent,
            Color.fromRGBO(255, 135, 73, 12),
            Color.fromRGBO(220, 134, 60, 10),
            Colors.redAccent
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                // textAlign: TextAlign.left,
                'Simple calculator',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CustomInput(
                          title: 'Enter First value',
                          num1: num1,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInput(title: 'Enter Second value', num1: num2)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OperationButton('Add', Icon(Icons.add), getNum),
                        OperationButton(
                            'Substract', Icon(Icons.remove), getNum),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OperationButton('Multiply', Icon(Icons.close), getNum),
                        OperationButton(
                            'Percentage', Icon(Icons.percent), getNum),
                      ],
                    ),
                    SizedBox(height: 20,),
                    if( widget.result!='')
                      Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.yellow,Colors.amber]),
                        border: Border.all(color: Colors.red,width: 3,style: BorderStyle.solid)
                      ),
                      child: Text(
                      'Result = '+ widget.result,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                    )



                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
