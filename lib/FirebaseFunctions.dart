import 'package:cloud_firestore/cloud_firestore.dart';

var users = FirebaseFirestore.instance.collection("users");

Future<bool> customerCheck(String number) async {
  print(number);
  var phoneNumbers = await users.doc('phone-numbers').get();

  for (var userId in phoneNumbers.data()!.keys) {
    if (phoneNumbers.data()![userId].toString().trim() == number.trim()) {
      print("User Exists!");
      await increaseLoyaltyPoints(userId.toString());
      return true;
    }
  }

  print("User Does not Exists!");
  return false;
}

Future<Null> increaseLoyaltyPoints(String userID) async {
  var loyaltyPointsData = await users.doc('loyalty-points').get();
  var loyaltyPoints = double.parse(loyaltyPointsData[userID].toString());
  loyaltyPoints = loyaltyPoints + 100;
  await users.doc('loyalty-points').update({userID: loyaltyPoints.toString()});
}

Future<Null> addUser(String name, String email, String dob, String phone)async{
  var userId = DateTime.now().toString().substring(0,9);

   await users.doc('user-details').update({
     userId: {
       'name' : name,
       'email' : email,
       'dob' : dob 
     }
   });

  await users.doc('phone-numbers').update({
     userId: phone
   });

  await users.doc('loyalty-points').update({
     userId: '0'
   });

}

