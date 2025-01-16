import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/favorites_provider.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardImage extends ConsumerWidget {
  const CardImage(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> favoriteProducts = ref.watch(favoriteProductsProvider);

    return SizedBox(
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset(
              product.image,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                ref
                    .read(favoriteProductsProvider.notifier)
                    .toggleFavoriteProduct(product);
              },
              icon: Icon(
                favoriteProducts.contains(product)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                size: 28,
                color: kColorScheme.appBarBackground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
