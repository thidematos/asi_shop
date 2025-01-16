import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/products/avaliable_colors.dart';
import 'package:asi_shop/widget/products/buy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardContent extends ConsumerWidget {
  const CardContent(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              product.title.toUpperCase(),
              style: kTextStyles.bodyText.copyWith(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: kColorScheme.cta,
                  size: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${product.price.toString()} AsiPoints',
                  style: kTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            AvaliableColors(product),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: BuyButton(product),
            )
          ],
        ),
      ),
    );
  }
}
