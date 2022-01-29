abstract class Repository<T> {
  Future<T> insert({required T item});
  Future<Map<int, T>> getAll();
  Future<T?> get({required int id});
}