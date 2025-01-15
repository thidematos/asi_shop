import 'package:asi_shop/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final avaliableProductsProvider = Provider(
  (ref) => [
    Product(title: 'Adesivo', price: 20, image: 'assets/adesivo.png'),
  ],
);
