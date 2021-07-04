import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:phone_fortune_flutter/components/number_button.dart';
import 'package:phone_fortune_flutter/constants.dart';
import 'package:phone_fortune_flutter/phone_number_brain.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String phoneNumber = "0";

  bool isMaxPhoneNumber() {
    if (phoneNumber.length >= 10) {
      return true;
    }
    return false;
  }

  void setNumber(String number) {
    setState(() {
      if (!isMaxPhoneNumber()) {
        phoneNumber += number;
      }
    });
  }

  Widget addNumberButton(String number) {
    return Expanded(
      child: NumberButton(
        onPress: () {
          setNumber(number);
        },
        number: number,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: label1TextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 120.0,
            margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      addNumberButton("1"),
                      addNumberButton("2"),
                      addNumberButton("3"),
                    ],
                  ),
                  Row(
                    children: [
                      addNumberButton("4"),
                      addNumberButton("5"),
                      addNumberButton("6"),
                    ],
                  ),
                  Row(
                    children: [
                      addNumberButton("7"),
                      addNumberButton("8"),
                      addNumberButton("9"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberButton(
                          onPress: () {
                            setState(() {
                              phoneNumber = "";
                            });
                          },
                          color: Colors.lightBlue[200],
                          number: "R",
                        ),
                      ),
                      addNumberButton("0"),
                      Expanded(
                        child: NumberButton(
                          onPress: () {
                            setState(() {
                              if (phoneNumber.length - 1 >= 0) {
                                phoneNumber = phoneNumber.substring(
                                    0, phoneNumber.length - 1);
                              }
                            });
                          },
                          color: Colors.pink[200],
                          number: "C",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isMaxPhoneNumber()) {
                PhoneNumberBrain brain = PhoneNumberBrain(phoneNumber);
                List<String> result = brain.calculate();
                String comment=result[0].replaceAll('，', '，\n');
                comment+="。";
                print(comment);
                int resultIndex = result[1] == '大吉'
                    ? 0
                    : result[1] == '吉'
                        ? 1
                        : result[1] == '凶'
                            ? 2
                            : result[1] == '凶帶吉'
                                ? 3
                                : result[1] == '吉帶凶'
                                    ? 4
                                    : 0;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              phoneNumber: phoneNumber,
                              resultIndex: resultIndex,
                              result: comment,
                            )));
              }
            },
            child: Container(
              width: 200,
              height: 60.0,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: bottomButtonColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
              child: Center(
                child: Text(
                  '計算',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
