import 'package:cloud_firestore/cloud_firestore.dart';

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
    "DateOfVisit": DateTime.now()
  });
}

Future<Null> addUser(
    String name, String email, String dob, String phone) async {
  // add user
  var docRef = await users.add({
    "Number": phone,
    "Name": name,
    "Loyalty Points": 100,
    // "DOB": TODO: Add dataTime,
    "Email": email,
  });

  // add user's visit
  await visits.add({
    "LPafterVisit": 100,
    "UserID": docRef.id,
    "DataOfVisit": DateTime.now()
  });
}
