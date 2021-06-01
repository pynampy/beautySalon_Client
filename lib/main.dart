import 'package:flutter/material.dart';
import 'package:salon_client/screens/AddDetails.dart';
import 'package:salon_client/screens/CustomerPhone.dart';
import 'package:salon_client/screens/LoyaltyPointsAdded.dart';
// import './screens/mainmenu.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/visits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VisitsScreen(),
      routes: {
        CustomerPhone.route: (ctx) => CustomerPhone(),
        LoyaltyPointsAddedScreen.route: (ctx) => LoyaltyPointsAddedScreen(),
        Details.route: (ctx) => Details()
      },
    );
  }
}
