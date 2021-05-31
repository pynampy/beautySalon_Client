import 'package:flutter/material.dart';

class LoyaltyPointsAddedScreen extends StatelessWidget {

  static const route = 'LoyaltyPointsAddedScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Text("THANK YOU FOR VISIT !!"),
          Text("100 LOYALTY POINTS ADDED !!"),
      ],
    ),
        ));
  }
}
