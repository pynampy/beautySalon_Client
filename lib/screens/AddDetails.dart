import 'package:flutter/material.dart';
import 'package:salon_client/FirebaseFunctions.dart';
import 'package:salon_client/screens/LoyaltyPointsAdded.dart';
import 'package:flutter/foundation.dart';

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
    final screenHeight = MediaQuery.of(context).size.height.roundToDouble();
    final screenWidth = MediaQuery.of(context).size.width.roundToDouble();

    return Scaffold(
      backgroundColor: Color(0xffEF7F69),
      body: Center(
        child: Container(
          height: screenHeight * 0.95,
          width: kIsWeb ? screenWidth * 0.4 : screenWidth * 0.95,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: kIsWeb ? screenWidth * 0.2 : screenWidth * 0.7,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffEF7F69))),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: nameTextController,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Enter your Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: kIsWeb ? screenWidth * 0.2 : screenWidth * 0.7,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffEF7F69))),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: emailTextController,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Enter your DOB",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: kIsWeb ? screenWidth * 0.2 : screenWidth * 0.7,
                height: screenHeight * 0.05,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffEF7F69))),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: dobTextController,
                ),
              ),
              SizedBox(height: 10,),
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
                        width: kIsWeb ? screenWidth * 0.2 : screenWidth * 0.7,
                        color: Color(0xffEF7F69),
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Enter",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          )),
        ),
      ),
    );
  }
}
