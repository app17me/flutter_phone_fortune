import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Color? color;
  final void Function()? onPress;

  NumberButton({required this.number, this.onPress, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(number,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color == null ? Colors.amber : color,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(6.0, 6.0),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ]),
      ),
    );
  }
}
