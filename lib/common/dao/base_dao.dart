import 'package:flutter_demo/common/database_provider/database_provider.dart';

abstract class Dao<T> {

  final DatabaseProvider databaseProvider = DatabaseProvider();

  Future<T> insert(T record);

  Future<T> update(T record);

  Future<bool> delete(T record);

  Future<List<T>> getRecords ();

  Future<T> getRecordByID (String recordID);

}