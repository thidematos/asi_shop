import 'package:asi_shop/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CartProperties { product, quantity, total }

class CartNotifier extends StateNotifier<List<Map<CartProperties, Object>>> {
  CartNotifier() : super([]);

  void clearCart() {
    state = [];
  }

  void addProductToCart(Product product) {
    final List<Product> curProducts = state
        .map((cartItem) => cartItem[CartProperties.product] as Product)
        .toList();

    if (curProducts.contains(product)) {
      state = state.map((cartItem) {
        if (cartItem[CartProperties.product] == product) {
          return {
            ...cartItem,
            CartProperties.quantity:
                (cartItem[CartProperties.quantity] as int?)! + 1,
            CartProperties.total:
                calculateItemTotal(cartItem, isStaleState: true),
          };
        }

        return cartItem;
      }).toList();

      return;
    }

    state = [
      ...state,
      {
        CartProperties.product: product,
        CartProperties.quantity: 1,
        CartProperties.total: product.price,
      }
    ];

    print(state);
  }

  int calculateItemTotal(curItem, {bool isStaleState = false}) {
    int total = 0;

    final int curValue = (curItem[CartProperties.product] as Product).price;
    int curQuantity = curItem[CartProperties.quantity] as int;

    if (isStaleState) curQuantity = curQuantity + 1;

    total += curValue * curQuantity;

    return total;
  }

  void changeQuantity(cartItem, String operation) {
    state = state.map((item) {
      if (item != cartItem) {
        return item;
      }

      final curQuantity = item[CartProperties.quantity] as int;

      if (curQuantity == 0 && operation == 'remove') {
        return item;
      }

      item[CartProperties.quantity] =
          operation == 'add' ? curQuantity + 1 : curQuantity - 1;

      item[CartProperties.total] = calculateItemTotal(item);

      return item;
    }).where((item) {
      final curQuantity = item[CartProperties.quantity] as int;
      return curQuantity == 0 ? false : true;
    }).toList();
  }

  void removeItem(cartItem) {
    state = state.where((item) => cartItem != item).toList();
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<Map<CartProperties, Object>>>(
  (ref) => CartNotifier(),
);
