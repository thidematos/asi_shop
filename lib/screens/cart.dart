import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/providers/user_provider.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/cart/cart_list.dart';
import 'package:asi_shop/widget/cart/order_resume.dart';
import 'package:asi_shop/widget/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: 'AsiCarrinho',
        asipoints: ref.watch(userProvider).asipoints,
        useActions: false,
        goTo: () {},
      ).mainAppBarWidget,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CartList()),
          if (cart.isNotEmpty) OrderResume()
        ],
      ),
    );
  }
}
