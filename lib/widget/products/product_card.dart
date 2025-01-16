import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/products/card_content.dart';
import 'package:asi_shop/widget/products/card_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: kColorScheme.border, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 240,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardImage(product),
          CardContent(product),
        ],
      ),
    );
  }
}
