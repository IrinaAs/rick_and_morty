class InMemoryCache {
  static InMemoryCache _inMemoryCache;

  InMemoryCache._();

  int id;

  static InMemoryCache instance() =>
      _inMemoryCache = _inMemoryCache ?? InMemoryCache._();
}
