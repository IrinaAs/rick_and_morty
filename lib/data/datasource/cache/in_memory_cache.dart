class InMemoryCache {
  static InMemoryCache _inMemoryCache;

  InMemoryCache._();

  int id;
  List<int> idEpisods;

  static InMemoryCache instance() =>
      _inMemoryCache = _inMemoryCache ?? InMemoryCache._();
}
