import 'package:asi_shop/models/user.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Order {
  Order({required this.cartItems, required this.total, required this.user});

  final List<Map<CartProperties, Object>> cartItems;
  final int total;
  final User user;
  final DateTime timestamp = DateTime.now();
  final String id = uuid.v4();
}
