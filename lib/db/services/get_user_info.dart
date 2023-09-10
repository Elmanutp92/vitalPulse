import 'package:cloud_firestore/cloud_firestore.dart';


final db = FirebaseFirestore.instance;

Future<List> getUserInfo(String userId) async {
  List userInfo = [];

  CollectionReference users =
      db.collection('users').doc(userId).collection('userInfo');
 // print('userId Actual: $userId');

  QuerySnapshot queryUsers = await users.get();
  for (var element in queryUsers.docs) {
    userInfo.add(element.data());
  }

  return userInfo;
}
