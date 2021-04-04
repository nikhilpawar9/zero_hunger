import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_hunger/models/feedinfo.dart';

class DatabaseMethods {
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference feedCollection =
      FirebaseFirestore.instance.collection('feed');

  Future <void>updateUserData(String name, String desc, String location) async {
    return await feedCollection.doc(uid).set({
      'name': name,
      'description': desc,
      'location': location,
    });
  }

  //feed list from snapshot
  List<Feed> _feedListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Feed(
        name: doc.data()['name'] ?? '',
        description: doc.data()['description'] ?? '',
        location: doc.data()['location'] ?? '',
      );
    }).toList();
  }

  //get feed stream
  Stream<List<Feed>> get feed {
    return feedCollection.snapshots().map(_feedListFromSnapshot);
  }
}
