import 'package:cloud_firestore/cloud_firestore.dart';

import '../classes/UserDetails.dart';

class FirestoreService {

  final CollectionReference userDetails = FirebaseFirestore.instance.collection('userDetails');

  // CREATE account
  Future<void> createUserDetails(UserDetails? user) async {
    final Map<String, dynamic> userFields = {
        'uid': user?.uid,
        'f_name:': user?.fname,
        'l_name': user?.lname,
    };

    await userDetails.doc(user?.uid).set(userFields);
  }

  // GET user details
    Future<Map<String, dynamic>> getUserDetails(String? uid) async {
      final docRef = FirebaseFirestore.instance.collection("userDetails").doc(uid);
    // Map<String, dynamic> data = {};

      try {
        DocumentSnapshot doc = await docRef.get();

        if(doc.exists) {
          print("yay");
          print(doc.data());
          return doc.data() as Map<String, dynamic>;
        } else {
          print("No data");
          return {};
        }

      } catch(e) {
        print("erorr");
        return {};
      }
    // docRef.get().then(
    //       (DocumentSnapshot doc) {
    //         return  doc.data() as Map<String, dynamic>;
    //         return data;
    //   },
    //   onError: (e) => print("Error getting document: $e"),
    // );
    //
    // return data;
  }
}