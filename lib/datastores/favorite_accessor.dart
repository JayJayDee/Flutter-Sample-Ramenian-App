abstract class FavoriteAccessor {
  Future<List<int>> fetchFavoriteIds();
  Future<void> storeFavoriteId(int ramenId);
}