import 'package:flutter/material.dart';
import 'package:salon_client/widgets/custombutton.dart';

import '../FirebaseFunctions.dart';

class VisitsScreen extends StatefulWidget {
  static const route = "/VisitsScreen";
  @override
  _VisitsScreenState createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen> {
  // true when user taps on a user to see their visits
  var checkUser = false;
  var checkUserID = "";
  var checkUserName = "";
  @override
  Widget build(BuildContext context) {
    var screenHeight =
        MediaQuery.of(context).size.height.roundToDouble() - 40.0;
    var screenWidth = MediaQuery.of(context).size.width.roundToDouble() - 40.0;
    screenWidth = screenWidth <= 1200 ? screenWidth : 1200;
    screenHeight = screenHeight <= 800 ? screenHeight : 800;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            // color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight / 3,
                  width: screenWidth,
                  child: Center(
                    child: Text(
                      "All Users",
                      style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Container(
                  height: (2 * screenHeight) / 3,
                  width: screenWidth,
                  // color: Colors.amber,
                  child: Center(child: vistsTable(screenHeight, screenWidth)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vistsTable(double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              singleCell(screenHeight / 16, screenWidth / 5, "Name", true),
              if (!checkUser)
                singleCell(
                    screenHeight / 16, screenWidth / 5, "Birthday", true),
              singleCell(screenHeight / 16, screenWidth / 5,
                  checkUser == false ? "Phone Number" : "Date of Visit", true),
              singleCell(
                  screenHeight / 16, screenWidth / 5, "Loyalty Points", true)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          if (checkUser)
            Container(
              height: (2 * screenHeight) / 4,
              child: FutureBuilder(
                future: visitList(checkUserID, checkUserName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    var visitsList = snapshot.data;
                    return SingleChildScrollView(
                        child: dataRows(screenHeight, screenWidth, visitsList));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          if (!checkUser)
            Container(
              height: (2 * screenHeight) / 4,
              child: FutureBuilder(
                future: userLists(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                        child:
                            dataRows(screenHeight, screenWidth, snapshot.data));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
        ],
      ),
    );
  }

  Widget singleCell(double height, double width, String text, bool isTitle) {
    return Container(
        height: height,
        width: width,

        // color: Colors.blue,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: isTitle ? 2 : 1)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: height * 0.3,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
          textAlign: TextAlign.center,
        )));
  }

  Widget dataRows(double screenHeight, double screenWidth, dynamic visitsList) {
    var dataRows = <Widget>[];

    for (var i = 0; i < visitsList.length; i++) {
      dataRows.add(GestureDetector(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            singleCell(screenHeight / 18, screenWidth / 5,
                "${visitsList[i][0]}", false),
            singleCell(screenHeight / 18, screenWidth / 5,
                "${visitsList[i][1]}", false),
            singleCell(screenHeight / 18, screenWidth / 5,
                "${visitsList[i][2]}", false),
            if (!checkUser)
              singleCell(screenHeight / 18, screenWidth / 5,
                  "${visitsList[i][3]}", false),
          ]),
          onTap: () {
            setState(() {
              checkUser = true;
              checkUserID = visitsList[i][4];
              checkUserName = visitsList[i][0];
            });
          }));
    }

    if (checkUser) {
      dataRows.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
            text: "Back",
            onPressed: () {
              setState(() {
                checkUser = false;
                checkUserID = "";
                checkUserName = "";
              });
            },
            height: screenHeight / 18,
            width: screenWidth / 6),
      ));
    }

    return Column(
      children: [...dataRows],
    );
  }
}
