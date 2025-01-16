import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:asi_shop/theme/text_styles.dart';
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
      return Padding(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Column(
          spacing: 10,
          children: [
            Image.asset('assets/tony.png'),
            Text(
              'Nenhum AsiProduto disponível...',
              textAlign: TextAlign.center,
              style: kTextStyles.bodyText.copyWith(
                fontSize: 32,
              ),
            )
          ],
        ),
      );
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
