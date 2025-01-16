import 'dart:math';

import 'package:asi_shop/models/order.dart';

class User {
  User(this.name) : asipoints = Random().nextInt(200) + 5;

  final String name;
  int asipoints;
  final List<Order> orders = [];
}
