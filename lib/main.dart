import 'package:flutter/material.dart';
import 'TopButton.dart';
import 'BottonButton.dart';
import 'Calculation.dart';
import 'dart:math';
import 'packageee.dart';

String Answer;
List<calc> operators;
List<calc> operators1;
String n2;
String n1;
int start = 0;
int coo = 0;
int end = 0;
String in1 = "";
String inputText;
bool negscheak = false;
bool negscheak1 = false;
double Ans = 2;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcultorHomePage(),
      title: "Caculator",
    );
  }
}

class CalcultorHomePage extends StatefulWidget {
  @override
  CalcultorHomePageState createState() => CalcultorHomePageState();
}

class CalcultorHomePageState extends State {
  var textResult = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Column(
                    children: [
                      TextField(
                        controller: textResult,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Text(
                            "Answer: ${Answer}",
                            textAlign: TextAlign.start,
                          )),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              children: [
                TopButton(
                  Action: setText,
                  lable: "Log",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "Ln",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "sin",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "cos",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "tan",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "(",
                ),
              ],
            ),
            Row(
              children: [
                TopButton(
                  Action: setText,
                  lable: "!",
                ),
                TopButton(
                  Action: setText,
                  lable: "Exp",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "asin",
                ),
                TopButton(
                  Action: setText,
                  lable: "acos",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: "atan",
                  Qos: "(",
                ),
                TopButton(
                  Action: setText,
                  lable: ")",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottonButton(
                  Action: setText,
                  lable: "9",
                ),
                BottonButton(
                  Action: setText,
                  lable: "8",
                ),
                BottonButton(
                  Action: setText,
                  lable: "7",
                ),
                BottonButton(
                  Action: setText,
                  lable: "AC",
                ),
                BottonButton(
                  Action: setText,
                  lable: "DEL",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottonButton(
                  Action: setText,
                  lable: "4",
                ),
                BottonButton(
                  Action: setText,
                  lable: "5",
                ),
                BottonButton(
                  Action: setText,
                  lable: "6",
                ),
                BottonButton(
                  Action: setText,
                  lable: "*",
                ),
                BottonButton(
                  Action: setText,
                  lable: "/",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottonButton(
                  Action: setText,
                  lable: "1",
                ),
                BottonButton(
                  Action: setText,
                  lable: "2",
                ),
                BottonButton(
                  Action: setText,
                  lable: "3",
                ),
                BottonButton(
                  Action: setText,
                  lable: "+",
                ),
                BottonButton(
                  Action: setText,
                  lable: "-",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottonButton(
                  Action: setText,
                  lable: "0",
                ),
                BottonButton(
                  Action: setText,
                  lable: ".",
                ),
                BottonButton(
                  Action: setText,
                  lable: "Ans",
                ),
                BottonButton(
                  Action: setText,
                  lable: "^",
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: OutlinedButton(
                    onPressed: () {
                      Calculate();
                    },
                    child: Text(
                      "=",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setText(String s) {
    setState(() {
      switch (s) {
        case "AC":
          textResult = TextEditingController(text: "");
          break;
        case "DEL":
          textResult = TextEditingController(
              text: textResult.text.substring(0, textResult.text.length - 1));
          break;
        default:
          textResult = TextEditingController(text: textResult.text + s);
          break;
      }
    });
  }

  void Calculate() {
    operators = new List<calc>();
    operators1 = new List<calc>();
    // in = "1+asin(0.5)";
    inputText = textResult.text;
    n2 = "";
    n1 = "";
    cheakqous();
    setState(() {
      Answer = inputText;
      Ans = double.parse(Answer);
    });
  }

  void cheakqous() {
    //print("1asas");
    String in22 = "";
    int cquos = 0;

    for (int i = 0; i < inputText.length; i++) {
      if (inputText[i] == '(') {
        cquos++;
      }
    }
    // print("1");
    if (cquos != 0) {
      int start = 1;
      int end = 2;
      // print("2");
      for (int i = 0; i < cquos; i++) {
//this loops for get the content inside any () in order. begain at the last () according to priority
        for (int j = 0; j < inputText.length; j++) {
          if (inputText[j] == '(') {
            for (int k = j; k < inputText.length; k++) {
              if (inputText[k] == '(') {
                start = k + 1;
              } else {
                if (inputText[k] == ')') {
                  end = k - 1;
                  break;
                }
              }
            }
            break;
          }
        }
        String QosContant = "";
        // storge the content that taken from the () above to send them to MakeResult
        // method get the result
        for (int m = start; m <= end; m++) {
          QosContant = QosContant + inputText[m];
        }
        //print("3232323");
        reArrang(QosContant);
        QosContant = MakeResult(QosContant);
        String ContAfterQos = "";
        String ContBeforeQos = "";

        // this try catch blocks for the case of in.charAt(start - 2) is not define bez
        // (start is less than 2)
        bool b = false;
        try {
          b = !isInteger(inputText[start - 2]) &&
              inputText[start - 2] != '(' &&
              inputText[start - 2] != '*' &&
              inputText[start - 2] != '+' &&
              inputText[start - 2] != '-' &&
              inputText[start - 2] != '/' &&
              inputText[start - 2] != '^' &&
              inputText[start - 2] != '!';
        } catch (e) {}
        if (b) {
          for (int o = start; o >= 0; o--) {
            if (isOprator(inputText[o])) {
              ContBeforeQos = inputText.substring(0, o + 1);

              break;
            }
          }
          // ContBeforeQos = in.substring(0, start - 4);
          if (end + 2 < inputText.length) {
            ContAfterQos = inputText.substring(end + 2, inputText.length);
          }
          //print("ContBeforeQos= " + ContBeforeQos);
          //print("e1= " + ContBeforeQos);
          // System.out.println("e11233= " + in21);
          String QosOfFunc = "";
          for (int k = start - 2; k >= 0; k--) {
            if (inputText[k] == '(' ||
                inputText[k] == '*' ||
                inputText[k] == '-' ||
                inputText[k] == "+" ||
                inputText[k] == '/' ||
                inputText[k] == '^') {
              break;
            }
            // QosOfFunc يعامل ما ددخل الاقواس على اسا انها اقواس تابعة لل الفانكشنز
            QosOfFunc = inputText[k] + QosOfFunc;
            // print("QosOfFunc= " + QosOfFunc);
          }
          QosContant = QosOfFunc + QosContant;
          QosContant = calco(QosContant, '=', "1");
          inputText = ContBeforeQos + QosContant + ContAfterQos;
          //print("in= " + inputText);
        } else {
          ContBeforeQos = inputText.substring(0, start - 1);
          if (end + 2 < inputText.length) {
            ContAfterQos = inputText.substring(end + 2, inputText.length);
          }
          inputText = ContBeforeQos + QosContant + ContAfterQos;
        }
        inputText = ContBeforeQos + QosContant + ContAfterQos;
      }
    }
    //print(inputText.substring(0, 2));

    if (inputText.substring(0, inputText.length).contains("An")) {
      inputText = inputText.replaceAll("Ans", Ans.toString());
      // print(inputText.replaceAll("Ans", Ans.toString()));
    }
    inputText = reArrang(inputText);
    inputText = MakeResult(inputText);
  }

  String MakeResult(String inMak) {
    int bb = operators.length;
    if (bb == 0) {
      return inMak;
    } else {
      for (int i = 0; i < bb; i++) {
        String in2 = "";
        int co = 0;
        for (int j = 0; j < 2; j++) {
          if (j == 0) {
            for (int k = 0; k < inMak.length; k++) {
              if (k > operators[0].index &&
                  (inMak[k] != '*' &&
                      inMak[k] != '+' &&
                      inMak[k] != '-' &&
                      inMak[k] != '/' &&
                      inMak[k] != '^' &&
                      inMak[k] != '!') &&
                  co == 0) {
                if (operators[0].opr != '!') {
                  n2 = n2 + inMak[k];
                  end = k;
                } else {
                  break;
                }
              } else {
                // هاد الشرط لاخذ بقية المتغير من اليمين في حال كانت الاشارة المأخوذة ليست في
                // نهاية المتغير

                if (k == operators[0].index + 1 && inMak[k] == '-') {
                  n2 = n2 + inMak[k];
                } else {
                  if (k > operators[0].index) {
                    co = 1;
                    in2 = in2 + inMak[k];
                  }
                }
              }
            }
          }
          if (j == 1) {
            for (int k = operators[0].index - 1; k >= 0; k--) {
              if ((inMak[k] != '*' &&
                  inMak[k] != '+' &&
                  inMak[k] != '-' &&
                  inMak[k] != '/' &&
                  inMak[k] != '^')) {
                n1 = n1 + inMak[k];
                //print("Leftnum  " + n1);
                start = k;
                if (inMak[k] == 'l') {
                  break;
                }
              } else {
                if (inMak[k] == '-' && inMak[k - 1] == 'E') {
                  n1 = n1 + inMak[k];
                  continue;
                }
                if (k == 0 && inMak[k] == '-') {
                  n1 = n1 + inMak[k];
                  // print("Leftnum  " + n1);
                }
                break;
              }
            }
          }
        }
        in1 = "";
        double res = 0;
        bool bk = false;
        res = double.parse(calco(revers(n1), operators[0].opr, n2));
        for (int l = 0; (l < start) && l < inMak.length; l++) {
          try {
            /*	*/
            if (inMak[0] == '-') {
              for (int w = 0; w < n1.length; w++) {
                if (w == 0) {
                  bk = inMak[w] == revers(n1)[w];
                } else {
                  bk = bk && inMak[w] == revers(n1)[w];
                }
              }
            } else {
              if (!(inMak == n1)) {
                bk = false;
              } else {
                bk = true;
              }
            }
          } catch (e) {}
          if (bk) {
          } else {
            in1 = in1 + inMak[l];
          }
        }

        in1 = in1 + res.toString() + in2;
        if (in1[0] == '-' && in1[1] == '-') {
          in1 = in1.substring(1, in1.length);
        }
        //print("RightRemain " + in1);

        inMak = in1;

        operators.clear();
        if (i != bb - 1) {
          //print("reeeeee:::");
          reArrang(inMak);
        }
        n1 = "";
        n2 = "";
      }

      return inMak;
    }
  }

  String reArrang(String Result) {
    // هي المثود لحل مشكلة تواجد احد الاشارت ببداية المتغير
    // هي المثود مشان ترتب الاشارات حسب الاولوية
    operators.clear();
    List<String> oprs = [];
    for (int i = 0; i < Result.length; i++) {
      if (i != 0) {
        if (Result[i - 1] != '-' &&
                Result[i - 1] != '*' &&
                Result[i - 1] != '+' &&
                Result[i - 1] != '/' &&
                Result[i - 1] != '^' &&
                Result[i - 1] != '!' &&
                Result[i - 1] != 'E' ||
            (Result[i] != '-')) {
          switch (Result[i]) {
            case '+':
              operators.add(new calc(opr: Result[i], weight: 4, index: i));
              oprs.add("+");
              break;
            case '^':
              operators.add(new calc(opr: Result[i], weight: 1, index: i));
              oprs.add("^");
              break;
            case '-':
              operators.add(new calc(opr: Result[i], weight: 4, index: i));
              oprs.add("-");
              break;
            case '*':
              operators.add(new calc(opr: Result[i], weight: 3, index: i));
              oprs.add("*");
              break;
            case '/':
              operators.add(new calc(opr: Result[i], weight: 3, index: i));
              oprs.add("/");
              break;
            case '!':
              operators.add(new calc(opr: Result[i], weight: 0, index: i));
              oprs.add("!");
              break;
          }
        } else {
          if (Result[i] != '-') {
            switch (Result[i + 1]) {
              case '*':
                operators.add(new calc(opr: Result[i], weight: 0, index: i));
                oprs.add("!");
                break;
            }
          }
        }
      }
    }

    if (oprs.contains("*") ||
        oprs.contains("^") ||
        oprs.contains("/") ||
        oprs.contains("!")) {
      for (int i = 0; i < operators.length; i++) {
        //print("2st loop");
        for (int j = 0; j < operators.length && j != i; j++) {
          if (operators[i].weight < operators[j].weight) {
            calc rep = operators[i];
            operators[i] = operators[j];
            operators[j] = rep;
          }
        }
      }
    }
    return Result;
  }
}
