import 'package:asi_shop/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends StateNotifier<List<Product>> {
  FavoritesNotifier() : super([]);

  void toggleFavoriteProduct(Product product) {
    if (state.contains(product)) {
      state =
          state.where((favoriteProduct) => favoriteProduct != product).toList();
    } else {
      state = [...state, product];
    }
  }
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoritesNotifier, List<Product>>(
  (ref) => FavoritesNotifier(),
);
