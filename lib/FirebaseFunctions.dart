import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

var users = FirebaseFirestore.instance.collection("users");
var visits = FirebaseFirestore.instance.collection("visits");

Future<bool> customerCheck(String number) async {
  var query = await users.where("Number", isEqualTo: number.trim()).get();

  if (query.docs.length == 1) {
    await increaseLoyaltyPoints(query.docs[0].id);
    return true;
  } else {
    return false;
  }
}

Future<Null> increaseLoyaltyPoints(String userID) async {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  // get the user document from the ID
  var userDoc = await users.doc(userID).get();

  // get user's loyalty points
  var loyaltyPoints = userDoc['Loyalty Points'];

  // increase loyalty points by 100
  loyaltyPoints = loyaltyPoints + 100;

  // update loyalty points
  await users.doc(userID).update({'Loyalty Points': loyaltyPoints});

  // add to visits
  await visits.add({
    "UserID": userID,
    "LPafterVisit": loyaltyPoints,
    "DateOfVisit": formatted
  });
}

Future<Null> addUser(
    String name, String email, String dob, String phone) async {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  // add user
  var docRef = await users.add({
    "Number": phone,
    "Name": name,
    "Loyalty Points": 100,
    "DOB": dob,
    "Email": email,
  });

  // add user's visit
  await visits.add(
      {"LPafterVisit": 100, "UserID": docRef.id, "DateOfVisit": formatted});
}

Future<List<List>> userLists() async {
  var userList = <List>[];

  var userDetails = await users.get();

  userDetails.docs.forEach((user) {
    var userData = user.data();
    userList.add([
      userData["Name"],
      userData["DOB"],
      userData["Number"],
      userData["Loyalty Points"],
      user.id.toString()
    ]);
  });
  print(userList);
  return userList;
}

Future<List<List>> visitList(String id, String name) async {
  var visitList = <List>[];

  var userVisits = await visits.where("UserID", isEqualTo: id).get();

  print(userVisits.docs.length);

  userVisits.docs.forEach((visit) {
    var visitData = visit.data();
    visitList.add([name, visitData["DateOfVisit"], visitData["LPafterVisit"]]);
  });

  print(visitList);
  return visitList;
}

// Previous function to call all the visits
/* Future<List> vistList() async {
  var finalList = <List>[];

  var userDetails = <String, dynamic>{};

  var visitsAll = await visits.orderBy("DateOfVisit").get();

  for (var visit in visitsAll.docs) {
    var visitData = visit.data();

    if (userDetails.containsKey(visitData["UserID"])) {
      finalList.add([
        userDetails[visitData["UserID"]][0],
        userDetails[visitData["UserID"]][1],
        visitData["DateOfVisit"],
        visitData["LPafterVisit"]
      ]);
    } else {
      var user = await users.doc(visitData["UserID"]).get();

      userDetails[visitData["UserID"]] = [
        user.data()!["Name"],
        user.data()!["DOB"]
      ];
      finalList.add([
        user.data()!["Name"],
        user.data()!["DOB"],
        visitData["DateOfVisit"],
        visitData["LPafterVisit"]
      ]);
    }
  }

  return finalList;
} */
