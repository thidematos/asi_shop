import 'package:asi_shop/providers/order_provider.dart';
import 'package:asi_shop/widget/orders/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderList extends ConsumerWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderProvider);

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (ctx, index) => OrderItem(
        order: orders[index],
      ),
    );
  }
}
