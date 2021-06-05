import 'package:flutter/material.dart';

class LoyaltyPointsAddedScreen extends StatelessWidget {
  static const route = 'LoyaltyPointsAddedScreen';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();

    return Scaffold(
        backgroundColor: Color(0xffEF7F69),
        body: Center(
          child: Container(
            height: screenHeight*0.8,
            width: screenWidth*0.4,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("THANK YOU FOR VISIT !!"),
                Text("100 LOYALTY POINTS ADDED !!"),
              ],
            ),
          ),
        ));
  }
}
