

abstract class BaseRepository <T> {


  Future<T> insert(T record);

  Future<T> update(T record);

  Future<bool> delete(T record);

  Future<List<T>> getRecords();

  Future<T> getRecordByID (String recordID);


}