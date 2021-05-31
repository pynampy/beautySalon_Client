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
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Enter your Phone Number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: 200,
          child: TextField(
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
                      .popAndPushNamed(LoyaltyPointsAddedScreen.route);
                } else {
                  Navigator.of(context).popAndPushNamed(Details.route,
                      arguments: phoneTextController.text);
                }
              },
              child: Container(
                  //height: 50,
                  padding: EdgeInsets.all(10),
                  width: 200,
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Enter",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ))),
        )
      ],
    )));
  }
}
