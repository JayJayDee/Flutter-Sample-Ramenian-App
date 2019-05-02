abstract class FavoriteAccessor {
  Future<List<int>> fetchFavoriteIds();
  Future<void> storeFavoriteId(int ramenId);
  Future<void> removeFavoriteId(int ramenId);
}