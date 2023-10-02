import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final String buttonText;
  final Color btnColor;
  final Color txtColor;
  final double txtSize;
  final Function calback;
  CalButton({
    required this.txtColor,
   required this.buttonText,
    required this.btnColor,
    required this.txtSize,
    required this.calback,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      calback(buttonText);
      },
      child: Container(
        margin: EdgeInsets.all(6),
        height: 68,width: 72,
        child: Center(child: Text(buttonText,style: TextStyle(
          fontSize: txtSize,
          color: txtColor,
        ),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor,
        ),
      ),
    );
  }
}
