import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/models/user.dart';
import 'package:asi_shop/providers/favorites_provider.dart';
import 'package:asi_shop/providers/filters_provider.dart';
import 'package:asi_shop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Product> kInitialState = [
  Product(
    title: 'Adesivo',
    price: 20,
    image: 'assets/adesivo.png',
    colors: [
      Color.fromARGB(255, 15, 20, 40),
    ],
  ),
  Product(
    title: 'Botton',
    price: 30,
    image: 'assets/bottom.png',
    colors: [
      Color.fromARGB(255, 234, 236, 234),
      Color.fromARGB(255, 164, 167, 170),
      Color.fromARGB(255, 89, 90, 90),
      Color.fromARGB(255, 5, 5, 5),
    ],
  ),
  Product(
    title: 'Caneta',
    price: 40,
    image: 'assets/caneta.png',
    colors: [
      Color.fromARGB(255, 49, 49, 49),
      Color.fromARGB(255, 242, 242, 242),
      Color.fromARGB(255, 93, 89, 89),
    ],
  ),
  Product(
    title: 'Mousepad',
    price: 45,
    image: 'assets/mousepad.png',
    colors: [
      Color.fromARGB(255, 0, 37, 59),
      Color.fromARGB(255, 1, 8, 10),
    ],
  ),
  Product(
    title: 'Sacochila',
    price: 50,
    image: 'assets/sacochila.png',
    colors: [
      Color.fromARGB(255, 224, 227, 218),
      Color.fromARGB(255, 29, 32, 67),
    ],
  ),
  Product(
    title: 'Pulseira',
    price: 60,
    image: 'assets/pulseira.png',
    colors: [
      Color.fromARGB(255, 50, 84, 244),
      Color.fromARGB(255, 34, 34, 34),
    ],
  ),
  Product(
    title: 'Chaveiro',
    price: 70,
    image: 'assets/chaveiro.png',
    colors: [
      Color.fromARGB(255, 50, 84, 244),
      Color.fromARGB(255, 34, 34, 34),
      Color.fromARGB(255, 253, 253, 253),
    ],
  ),
  Product(
    title: 'Caderno',
    price: 110,
    image: 'assets/agenda.png',
    colors: [
      Color.fromARGB(255, 47, 114, 241),
      Color.fromARGB(255, 252, 252, 252),
      Color.fromARGB(255, 80, 75, 79),
    ],
  ),
  Product(
    title: 'Caneca',
    price: 120,
    image: 'assets/caneca.png',
    colors: [
      Color.fromARGB(255, 38, 37, 39),
      Color.fromARGB(255, 238, 240, 240),
    ],
  ),
  Product(
    title: 'Garrafa',
    price: 150,
    image: 'assets/garrafa.png',
    colors: [
      Color.fromARGB(255, 63, 63, 71),
      Color.fromARGB(255, 138, 141, 145),
    ],
  ),
];

class AvaliableProductsNotifier extends StateNotifier<List<Product>> {
  AvaliableProductsNotifier() : super(kInitialState);

  void selectColor(Product product, Color newSelectedColor) {
    state = state.map(
      (curProduct) {
        if (curProduct == product) {
          curProduct.selectedColor = newSelectedColor;
        }

        return curProduct;
      },
    ).toList();
  }
}

final avaliableProductsProvider =
    StateNotifierProvider<AvaliableProductsNotifier, List<Product>>(
  (ref) => AvaliableProductsNotifier(),
);

final filteredProductsProvider = Provider((ref) {
  final Map<Filter, bool> filters = ref.watch(filtersProvider);
  final List<Product> avaliableProducts = ref.watch(avaliableProductsProvider);
  final List<Product> favorites = ref.watch(favoriteProductsProvider);
  final User user = ref.watch(userProvider);

  List<Product> finalProducts = avaliableProducts;

  if (filters[Filter.favorite]!) {
    finalProducts = avaliableProducts.where((product) {
      if (favorites.contains(product)) {
        return true;
      }
      return false;
    }).toList();
  }

  if (filters[Filter.affordable]!) {
    finalProducts = finalProducts
        .where((product) => product.price <= user.asipoints)
        .toList();
  }

  return finalProducts;
});
