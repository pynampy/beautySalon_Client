import 'package:flutter/material.dart';
import 'package:salon_client/screens/CustomerPhone.dart';
import 'package:salon_client/screens/visits.dart';

import 'package:salon_client/widgets/custombutton.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight,
              width: screenWidth / 2,
              color: Color(0xffEF7F69),
              child: Center(
                child: CustomButton(
                  text: "CUSTOMER",
                  onPressed: () {
                    Navigator.of(context).pushNamed(CustomerPhone.route);
                  },
                ),
              ),
            ),
            Container(
              height: screenHeight,
              width: screenWidth / 2,
              color: Color(0xff79C2CB),
              child: Center(
                child: CustomButton(
                  text: "ADMIN",
                  onPressed: () {
                    Navigator.of(context).pushNamed(VisitsScreen.route);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
