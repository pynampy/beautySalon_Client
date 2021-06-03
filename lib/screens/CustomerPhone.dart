import 'package:flutter/material.dart';
import 'package:salon_client/FirebaseFunctions.dart';
import 'package:salon_client/screens/AddDetails.dart';
import 'package:salon_client/screens/LoyaltyPointsAdded.dart';

class CustomerPhone extends StatefulWidget {
  static const route = "/CustomerPhone";
  @override
  _CustomerPhoneState createState() => _CustomerPhoneState();
}

class _CustomerPhoneState extends State<CustomerPhone> {
  final phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();

    return Scaffold(
        body: Container(
      color: Color(0xffEF7F69),
      child: Center(
          child: Container(
        height: screenHeight * 0.8,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your Phone Number",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            Container(
              width: screenWidth * 0.2,
              height: screenHeight * 0.05,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffEF7F69))),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: phoneTextController,
              ),
            ),
            Material(
              child: InkWell(
                  onTap: () async {
                    var existingCustomer =
                        await customerCheck(phoneTextController.text);
                    if (existingCustomer) {
                      Navigator.of(context)
                          .pushNamed(LoyaltyPointsAddedScreen.route);
                    } else {
                      Navigator.of(context).pushNamed(Details.route,
                          arguments: phoneTextController.text);
                    }
                  },
                  child: Container(
                      //height: 50,
                      padding: EdgeInsets.all(10),
                      width: screenWidth * 0.2,
                      color: Color(0xffEF7F69),
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Enter",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ],
        ),
      )),
    ));
  }
}
