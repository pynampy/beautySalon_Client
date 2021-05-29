import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Customer",
              onPressed: () => {print("object")},
            ),
            CustomButton(
              text: "asdasd",
              onPressed: () => {print("object")},
            )
          ],
        ),
      ),
    );
  }
}
