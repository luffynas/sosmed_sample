abstract class BaseDatasource<T> {
  Stream<List<T>> get({bool fresh, int limit, int offset});

  Stream<T> getOne(String id);

  Future<void> add(T data);

  Future<void> update(T data);

  Future<void> remove(T data);
}
