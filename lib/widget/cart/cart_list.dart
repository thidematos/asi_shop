import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/widget/cart/cart_item.dart';
import 'package:asi_shop/widget/fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartList extends ConsumerWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productCart = ref.watch(cartProvider);

    if (productCart.isEmpty) {
      return Fallback();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: productCart.length,
            itemBuilder: (ctx, index) => CartItem(productCart[index]),
          ),
        ),
      ],
    );
  }
}
