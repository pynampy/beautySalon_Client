import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  CustomButton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    var screenWidth = MediaQuery.of(context).size.width.roundToDouble();
    screenWidth = screenWidth <= 1200 ? screenWidth : 1200;
    screenHeight = screenHeight <= 800 ? screenHeight : 800;
    return SizedBox(
      height: screenHeight / 10,
      width: screenWidth / 3,
      //margin: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.black12,
          hoverColor: Colors.black26,
          onTap: () {
            onPressed();
          },
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * 0.03),
          )),
        ),
      ),
    );
  }
}
