import 'dart:math';
import 'main.dart';



String calco(String n1, var op, String n2) {
  double res = 0, res1 = 0;
 // print("n1= " + n1 + " op= " + op + " n2= " + n2);
  List<String> nums = ["", ""];
  nums[0] = n1;
  nums[1] = n2;
  int on = 0;

  for (int i = 0; i < 2; i++) {
    try {
      switch (nums[i][0]) {
        case 's':
          switch (i) {
            case 0:
              res = sin(double.parse(n1.substring(3, n1.length)) * pi / 180);
              n1 = res.toString();
            //  print("///////////  ${n1}");
              break;
            case 1:
              res = sin(double.parse(n2.substring(3, n2.length)) * pi / 180);
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case 'A':
          switch (i) {
            case 0:
              res = (double.parse(n1.substring(3, n1.length)));
              n1 = res.abs().toString();
              break;
            case 1:
              res = (double.parse(n2.substring(3, n2.length)));
              n2 = res.abs().toString();
              break;
          }
          on++;
          break;
        case 'c':
          switch (i) {
            case 0:
              res = cos(double.parse(n1.substring(3, n1.length)) * pi / 180);
              n1 = res.toString();
              break;
            case 1:
              res = cos(double.parse(n2.substring(3, n2.length)) * pi / 180);
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case 't':
          switch (i) {
            case 0:
              res = tan(double.parse(n1.substring(3, n1.length)) * pi / 180);
              n1 = res.toString();
              break;
            case 1:
              res = tan(double.parse(n2.substring(3, n2.length)) * pi / 180);
              n2 = res.toString();
              break;
          }
          on++;
          break;

        case 'E':
          switch (i) {
            case 0:
              res = exp(double.parse(n1.substring(3, n1.length)));
              n1 = res.toString();
              break;
            case 1:
              res = exp(double.parse(n2.substring(3, n2.length)));
              n2 = res.toString();
              break;
          }
          on++;
          break;
      }

      switch (nums[i].substring(0, 2)) {
        case "as":
          switch (i) {
            case 0:
              res = asin(double.parse(n1.substring(4, n1.length))) / pi * 180;
              n1 = res.toString();
              break;
            case 1:
              res = asin(double.parse(n2.substring(4, n2.length))) / pi * 180;
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case "ac":
          switch (i) {
            case 0:
              res = acos(double.parse(n1.substring(4, n1.length))) / pi * 180;
              n1 = res.toString();
              break;
            case 1:
              res = acos(double.parse(n2.substring(4, n2.length))) / pi * 180;
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case "at":
          switch (i) {
            case 0:
              res = atan(double.parse(n1.substring(4, n1.length))) / pi * 180;
              n1 = res.toString();
              break;
            case 1:
              res = atan(double.parse(n2.substring(4, n2.length))) / pi * 180;
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case "Ln":
          switch (i) {
            case 0:
              res =
                  log(double.parse(n1.substring(2, n1.length))) * 2.302585093;
              n1 = res.toString();
              break;
            case 1:
              res =
                  log(double.parse(n2.substring(2, n2.length))) ;
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case "Lo":
          switch (i) {
            case 0:
              res = log(double.parse(n1.substring(3, n1.length)))/ log(10);
              n1 = res.toString();
              break;
            case 1:
              res = log(double.parse(n2.substring(3, n2.length)));
              n2 = res.toString();
              break;
          }
          on++;
          break;
        case "An":
          switch (i) {
            case 0:
              res = Ans;
              n1 = res.toString();
              break;
            case 1:
              res = Ans;
              n2 = res.toString();
              break;
          }
          on++;
          break;
      }
    } catch (e) {}
  }

  //print("n1= " + n1 + " op= " + op + " n2= " + n2);

  if (op == ' ') {
    res1 = double.parse(n1);
  } else {
    switch (op) {
      case '*':
        res1 = double.parse(n1) * double.parse(n2);
        break;
      case '+':
        res1 = double.parse(n1) + double.parse(n2);
        break;
      case '^':
        res1 = pow(double.parse(n1), double.parse(n2)).toDouble();
        break;
      case '/':
        res1 = double.parse(n1) / double.parse(n2);
        break;
      case '-':
        res1 = double.parse(n1) - double.parse(n2);
        break;
      case '!':
        res1 = Factorial(n1);
        break;
      case '=':
        if (on == 0) {
          res1 = double.parse(n1);
        } else {
          res1 = res;
        }
        break;
    }
  }
 // print("CalcResult " + res1.toString());
  return res1.toString();
}

double Factorial(String n11) {
  double res = 1;
  int k = int.parse(n11);
  for (int i = k; i >= 1; i--) {
    res = res * i;
  }
  return res;
}

bool isOprator(var opr) {
  switch (opr) {
    case '+':
    case '-':
    case '*':
    case '/':
    case '!':
    case '^':
      return true;
  }

  return false;
}

bool isInteger(String car) {
  for (int i = 0; i <= 9; i++) {
    if (car=="$i") {
      return true;
    }
  }
  return false;
}

String revers(String n) {
  String re = "";
  for (int k = n.length - 1; k >= 0; k--) {
    re = re + n[k];
  }
  return re;
}
