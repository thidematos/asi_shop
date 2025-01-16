import 'package:asi_shop/models/order.dart';
import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/utils/format_timestamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderItem extends ConsumerStatefulWidget {
  const OrderItem({required this.order, super.key});

  final Order order;
  @override
  ConsumerState<OrderItem> createState() {
    return _OrderItemState();
  }
}

class _OrderItemState extends ConsumerState<OrderItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Order order = widget.order;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTimestamp(order.timestamp),
                  style: kTextStyles.bodyText,
                ),
                Text(
                  'Pedido: #${order.id.substring(0, 10)}',
                  style: kTextStyles.bodyText.copyWith(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${order.total} AsiPoints',
                  style: kTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon:
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                )
              ],
            ),
            if (isExpanded)
              SizedBox(
                height: 100,
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'DETALHES DO PEDIDO',
                        style: kTextStyles.bodyText.copyWith(fontSize: 12),
                      ),
                    ),
                    for (final cartItem in order.cartItems)
                      Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              (cartItem[CartProperties.product] as Product)
                                  .title,
                              style: kTextStyles.bodyText.copyWith(
                                fontWeight: FontWeight.bold,
                                color: kColorScheme.cta,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 3,
                            children: [
                              Text(
                                'Cor:',
                                style: kTextStyles.bodyText.copyWith(),
                              ),
                              Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: (cartItem[CartProperties.product]
                                          as Product)
                                      .selectedColor,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Qtd. ${cartItem[CartProperties.quantity].toString()}',
                            style: kTextStyles.bodyText.copyWith(),
                          ),
                          Text(
                            'Total: ${cartItem[CartProperties.total].toString()}',
                            style: kTextStyles.bodyText.copyWith(),
                          ),
                        ],
                      )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
