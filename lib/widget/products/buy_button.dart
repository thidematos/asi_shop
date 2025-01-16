import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/screens/cart.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyButton extends ConsumerWidget {
  const BuyButton(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(cartProvider.notifier).addProductToCart(product);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => CartScreen(),
              ),
            );
          },
          style: ButtonStyle().copyWith(
              backgroundColor: WidgetStatePropertyAll(kColorScheme.cta)),
          child: Text(
            'Comprar'.toUpperCase(),
            style: kTextStyles.bodyText.copyWith(
              color: kColorScheme.ctaContrast,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
