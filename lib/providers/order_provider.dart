import 'package:asi_shop/models/order.dart';
import 'package:asi_shop/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNotifier extends StateNotifier<List<Order>> {
  OrderNotifier() : super([]);

  void newOrder(User user, cartItems, int total) {
    state = [...state, Order(cartItems: cartItems, total: total, user: user)];
  }
}

final orderProvider =
    StateNotifierProvider<OrderNotifier, List<Order>>((ref) => OrderNotifier());
