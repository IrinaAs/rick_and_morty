import 'package:rick_and_morty_app/data/datasource/cache/in_memory_cache.dart';

abstract class LocalRepository {
  void saveId(int id);
  int getId();
}

class LocalRepositoryImpl implements LocalRepository {
  static LocalRepository _localRepository;

  InMemoryCache _inMemoryCache;

  LocalRepositoryImpl._() {
    this._inMemoryCache = InMemoryCache.instance();
  }

  static LocalRepository instance() =>
      _localRepository = _localRepository ?? LocalRepositoryImpl._();

  @override
  int getId() => _inMemoryCache.id;

  @override
  void saveId(int id) => _inMemoryCache.id = id;
}
