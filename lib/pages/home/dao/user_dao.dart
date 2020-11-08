import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo/common/dao/base_dao.dart';
import 'package:flutter_demo/common/database_provider/database_provider.dart';
import 'package:flutter_demo/pages/home/model/user_model.dart';

class UserDao implements Dao<UserModel> {
  UserDao();


  @override
  DatabaseProvider databaseProvider = DatabaseProvider();

  @override
  Future<List<UserModel>> getRecords() async{

        FirebaseFirestore firestore = databaseProvider.instance;

    QuerySnapshot qShot = await firestore.collection("Users").get();

    return qShot.docs
        .map((doc) => UserModel.fromMap(doc.data()))
        .toList();

  }

  @override
  Future<bool> delete(UserModel record) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getRecordByID(String recordID) {
    // TODO: implement getRecordByID
    throw UnimplementedError();
  }

  @override
  Future<UserModel> insert(UserModel record) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<UserModel> update(UserModel record) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
