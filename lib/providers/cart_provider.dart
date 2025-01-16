import 'package:asi_shop/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Map<String, Object>>> {
  CartNotifier() : super([]);

  void addProductToCart(Product product) {
    state = [
      ...state,
      {
        'product': product,
        'quantity': 1,
      }
    ];

    print(state);
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<Map<String, Object>>>(
  (ref) => CartNotifier(),
);
