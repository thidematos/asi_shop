import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvaliableColors extends ConsumerWidget {
  const AvaliableColors(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          'Disponível nas cores:',
          style: kTextStyles.bodyText,
        ),
        Row(
          spacing: 10,
          children: [
            for (final color in product.colors)
              InkWell(
                onTap: () {
                  ref
                      .read(avaliableProductsProvider.notifier)
                      .selectColor(product, color);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: color,
                    border: Border.all(
                      width: product.selectedColor == color ? 2 : 1,
                      color: product.selectedColor == color
                          ? kColorScheme.ctaContrast
                          : kColorScheme.border,
                    ),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
