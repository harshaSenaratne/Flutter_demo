import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String age;
  String city;
  DocumentReference reference;

  UserModel({this.name, this.age, this.reference});
  UserModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Name'] != null),
        assert(map['Age'] != null),
        assert(map['City']!=null),
        name = map['Name'],
        age = map['Age'],
        city = map["City"];

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
