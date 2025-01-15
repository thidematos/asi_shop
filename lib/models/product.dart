import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Product {
  Product({required this.title, required this.price, required this.image});

  final String title;
  final int price;
  final String image;
  final String id = uuid.v4();
}
