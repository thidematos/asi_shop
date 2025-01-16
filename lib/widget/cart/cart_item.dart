import 'package:asi_shop/models/product.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/products/avaliable_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem(this.cartItem, {super.key});

  final Map<CartProperties, Object> cartItem;

  @override
  ConsumerState<CartItem> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
    final Product curProduct =
        widget.cartItem[CartProperties.product] as Product;

    final int curQuantity = widget.cartItem[CartProperties.quantity] as int;

    final int curTotal = widget.cartItem[CartProperties.total] as int;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 1, color: kColorScheme.border),
        ),
      ),
      height: 200,
      child: Row(
        children: [
          Image.asset(curProduct.image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        curProduct.title.toUpperCase(),
                        style: kTextStyles.bodyText.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .removeItem(widget.cartItem);
                        },
                        child: Text(
                          'Excluir',
                          style: kTextStyles.bodyText.copyWith(
                            color: kColorScheme.appBarBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AvaliableColors(
                    curProduct,
                    triggerState: () => setState(
                      () {},
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantidade',
                        style: kTextStyles.bodyText.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .changeQuantity(widget.cartItem, 'remove');
                        },
                        color: const Color.fromARGB(255, 197, 59, 49),
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        '$curQuantity',
                        style: kTextStyles.bodyText,
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(cartProvider.notifier)
                              .changeQuantity(widget.cartItem, 'add');
                        },
                        icon: Icon(Icons.add),
                        color: kColorScheme.appBarBackground,
                      )
                    ],
                  ),
                  Text(
                    'TOTAL: $curTotal AsiPoints',
                    style: kTextStyles.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
