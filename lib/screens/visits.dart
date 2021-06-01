import 'package:flutter/material.dart';

class VisitsScreen extends StatefulWidget {
  @override
  _VisitsScreenState createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen> {
  var visitsList = [
    [
      "Micheal Scott",
      "March/01",
      "June/02",
      "200",
    ],
    [
      "Dwight Shrute",
      "May/01",
      "June/02",
      "100",
    ],
    [
      "Jim Halpert",
      "Jun/30",
      "June/03",
      "100",
    ],
    [
      "Andrew Bernad",
      "March/29",
      "June/02",
      "100",
    ],
    [
      "Naman Jain",
      "August/01",
      "June/02",
      "100",
    ],
    [
      "Micheal Scott",
      "March/01",
      "June/02",
      "200",
    ],
    [
      "Dwight Shrute",
      "May/01",
      "June/02",
      "100",
    ],
    [
      "Jim Halpert",
      "Jun/30",
      "June/03",
      "100",
    ],
    [
      "Andrew Bernad",
      "March/29",
      "June/02",
      "100",
    ],
    [
      "Naman Jain",
      "August/01",
      "June/02",
      "100",
    ],
    [
      "Micheal Scott",
      "March/01",
      "June/02",
      "200",
    ],
    [
      "Dwight Shrute",
      "May/01",
      "June/02",
      "100",
    ],
    [
      "Jim Halpert",
      "Jun/30",
      "June/03",
      "100",
    ],
    [
      "Andrew Bernad",
      "March/29",
      "June/02",
      "100",
    ],
    [
      "Naman Jain",
      "August/01",
      "June/02",
      "100",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight =
        MediaQuery.of(context).size.height.roundToDouble() - 40.0;
    var screenWidth = MediaQuery.of(context).size.width.roundToDouble() - 40.0;
    screenWidth = screenWidth <= 1200 ? screenWidth : 1200;
    screenHeight = screenHeight <= 800 ? screenHeight : 800;

    print(screenHeight);

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
                  child: Center(
                    child: Column(
                        children: [vistsTable(screenHeight, screenWidth)]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vistsTable(double screenHeight, double screenWidth) {
    var dataRows = <Widget>[];

    int i = 0;
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

    return Container(
      width: screenWidth,
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            child: SingleChildScrollView(
              child: Column(
                children: [...dataRows],
              ),
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
}
