import 'package:calculator/screens/cal_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   // HomeScreen({super.key});
  late int firstNum;
  late int secondNum;
  String history='';
  String textToDisplay='';
  late String res;
  late String operation;

  void btnOnClick(String btnVal){
    print(btnVal);
    if(btnVal == 'C'){
      firstNum=0;
      secondNum=0;
      res = '';
    }else if(btnVal == 'AC'){
      firstNum=0;
      secondNum=0;
      res ='';
      history='';
    }else if( btnVal == '+'|| btnVal == '-' || btnVal == 'X' || btnVal == '/'){
      firstNum =int.parse(textToDisplay);
      res='';
      operation= btnVal;
    }else if(btnVal == '<'){
      res = textToDisplay.substring(0,textToDisplay.length-1);
    }else if(btnVal=='='){
      secondNum = int.parse(textToDisplay);
      if(operation=='+'){
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation=='-'){
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation=='X'){
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation=='/'){
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      }
    else{
      res =int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Calculator',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 2.0,bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Container(
             child: Padding(padding: EdgeInsets.all(12),
             child: Text(history,
               style: TextStyle(
               fontSize: 22,color: Colors.pink,
             ),),
             ),
             alignment: Alignment(1,1),
           ),
            Container(
              child: Padding(padding: EdgeInsets.all(12),
                child: Text(textToDisplay,
                  style: TextStyle(
                    fontSize: 32,fontWeight: FontWeight.bold,color: Colors.pink,
                  ),),
              ),
              alignment: Alignment(1,1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(buttonText: 'AC', btnColor: Colors.pink, txtSize: 28, calback: btnOnClick, txtColor: Colors.white,),
                CalButton(buttonText: 'C',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
                CalButton(buttonText: '<',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
                CalButton(buttonText: '/',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(buttonText: '7', btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent,),
                CalButton(buttonText: '8',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '9',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: 'x',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(buttonText: '4',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '5',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '6',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '-',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(buttonText: '3',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '2',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '1',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '+',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(buttonText: '+/-',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),
                CalButton(buttonText: '0',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '00',btnColor: Colors.white,txtSize: 20,calback: btnOnClick,txtColor: Colors.pinkAccent),
                CalButton(buttonText: '=',btnColor: Colors.pink,txtSize: 28,calback: btnOnClick, txtColor: Colors.white),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
