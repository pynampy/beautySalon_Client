import 'package:flutter/material.dart';
import 'package:salon_client/FirebaseFunctions.dart';
import 'package:salon_client/screens/LoyaltyPointsAdded.dart';

class Details extends StatefulWidget {
  static const route = '/details';
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final dobTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneNumber = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter your Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            child: TextField(
              controller: nameTextController,
            ),
          ),
          Text(
            "Enter your Email",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            child: TextField(
              controller: emailTextController,
            ),
          ),
          Text(
            "Enter your DOB",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            child: TextField(
              controller: dobTextController,
            ),
          ),
          Material(
            child: InkWell(
                onTap: () {
                  print(phoneNumber.toString());
                  print(nameTextController.text);
                  print(emailTextController.text);
                  print(dobTextController.text);
                  addUser(nameTextController.text, emailTextController.text,
                      dobTextController.text, phoneNumber.toString());

                  Navigator.of(context)
                      .popAndPushNamed(LoyaltyPointsAddedScreen.route);
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
      )),
    );
  }
}
