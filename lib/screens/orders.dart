import 'package:asi_shop/providers/order_provider.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/fallback.dart';
import 'package:asi_shop/widget/orders/order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderProvider);

    if (orders.isEmpty) {
      return Column(
        children: [
          Fallback(
            isOrders: true,
          )
        ],
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: OrderList(),
          ),
        ),
      ],
    );
  }
}
