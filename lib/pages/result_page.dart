import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:phone_fortune_flutter/constants.dart";
import "package:phone_fortune_flutter/phone_number_brain.dart";

class ResultPage extends StatelessWidget {

  final String phoneNumber;
  final int resultIndex;
  final String result;


  ResultPage({required this.phoneNumber,required this.resultIndex, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '計算結果',
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: bottomButtonColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(              
                child: Center(child: Image.asset('images/result0$resultIndex.png')),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
