import 'package:flutter/material.dart';

import '../FirebaseFunctions.dart';

class VisitsScreen extends StatefulWidget {
  @override
  _VisitsScreenState createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen> {
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
                      "Past Visits",
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
              singleCell(screenHeight / 16, screenWidth / 5, "Birthday", true),
              singleCell(
                  screenHeight / 16, screenWidth / 5, "Date of Visit", true),
              singleCell(
                  screenHeight / 16, screenWidth / 5, "Loyalty Points", true)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: (2 * screenHeight) / 4,
            child: FutureBuilder(
              future: vistList(),
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                if (snapshot.hasData) {
                  print(snapshot.data);
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

    int i = 0;
    print("vist len ${visitsList.length}");
    while (i < visitsList.length) {
      dataRows.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        singleCell(
            screenHeight / 18, screenWidth / 5, "${visitsList[i][0]}", false),
        singleCell(
            screenHeight / 18, screenWidth / 5, "${visitsList[i][1]}", false),
        singleCell(
            screenHeight / 18, screenWidth / 5, "${visitsList[i][2]}", false),
        singleCell(
            screenHeight / 18, screenWidth / 5, "${visitsList[i][3]}", false),
      ]));
      i++;
    }

    return Column(
      children: [...dataRows],
    );
  }
}
