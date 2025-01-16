import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/fallback.dart';
import 'package:asi_shop/widget/products/product_card.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> filteredProducts = ref.watch(filteredProductsProvider);

    if (filteredProducts.isEmpty) {
      return Fallback();
    }

    return Expanded(
      child: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) => ProductCard(
          product: filteredProducts[index],
        ),
      ),
    );
  }
}
