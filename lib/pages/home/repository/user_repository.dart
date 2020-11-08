import 'package:flutter_demo/common/repository/base_repository.dart';
import 'package:flutter_demo/pages/home/dao/user_dao.dart';
import 'package:flutter_demo/pages/home/model/user_model.dart';

class UserRepository implements BaseRepository<UserModel> {
  UserDao userDao = UserDao();

@override
  Future<List<UserModel>> getRecords() {
    
   return userDao.getRecords();
  }
  @override
  Future<bool> delete(UserModel record) {
    return userDao.delete(record);

  }

  @override
  Future<UserModel> getRecordByID(String recordID) {
     return userDao.getRecordByID(recordID);

  }

  @override
  Future<UserModel> insert(UserModel record) {
        return userDao.insert(record);

  }

  @override
  Future<UserModel> update(UserModel record) {
   return userDao.update(record);

  }
}
