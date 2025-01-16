import 'package:asi_shop/models/user.dart';
import 'package:asi_shop/providers/cart_provider.dart';
import 'package:asi_shop/providers/order_provider.dart';
import 'package:asi_shop/providers/user_provider.dart';
import 'package:asi_shop/screens/orders.dart';
import 'package:asi_shop/screens/tabs.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderResume extends ConsumerWidget {
  const OrderResume({super.key});

  void showError(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'AsiPoints insuficientes'.toUpperCase(),
          textAlign: TextAlign.center,
          style: kTextStyles.bodyText.copyWith(
            color: kColorScheme.errorRed,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: SizedBox(
          height: 250,
          child: Image.asset(
            'assets/sad-tony.png',
            height: double.infinity,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(
              'Voltar'.toUpperCase(),
              style: kTextStyles.bodyText.copyWith(
                color: kColorScheme.appBarBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int total = 0;
    ref.watch(cartProvider).forEach((cartItem) {
      final int curTotal = cartItem[CartProperties.total] as int;

      total += curTotal;
    });

    final cartItems = ref.watch(cartProvider);

    final User user = ref.watch(userProvider);

    final int userAsiPoints = ref.watch(userProvider).asipoints;

    final bool isAffordable = total <= userAsiPoints;

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 6, right: 6, bottom: 32),
      child: Column(
        spacing: 10,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total da compra: ',
                  style: kTextStyles.bodyText,
                ),
                Text(
                  '$total AsiPoints',
                  style: kTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Meus AsiPoints:',
                  style: kTextStyles.bodyText,
                ),
                Text(
                  '$userAsiPoints AsiPoints',
                  style: kTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isAffordable
                        ? kColorScheme.appBarBackground
                        : kColorScheme.errorRed,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isAffordable
                  ? kColorScheme.appBarBackground
                  : kColorScheme.errorRed,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: InkWell(
              onTap: () {
                if (!isAffordable) {
                  showError(context);
                  return;
                }

                ref
                    .read(orderProvider.notifier)
                    .newOrder(user, cartItems, total);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: kColorScheme.appBarBackground,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    content: Text(
                      'Pedido feito!'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kTextStyles.bodyText.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kColorScheme.appBarContrast,
                      ),
                    ),
                  ),
                );

                ref.read(userProvider.notifier).updateAsiPoints(total);

                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => TabsScreen()));

                ref.read(cartProvider.notifier).clearCart();
              },
              splashColor: kColorScheme.ctaContrast,
              child: Text(
                isAffordable
                    ? "PAU NA MÁQUINA 🚀🚀🚀"
                    : "AsiPoints insuficientes =[",
                textAlign: TextAlign.center,
                style: kTextStyles.bodyText.copyWith(
                  fontSize: 20,
                  color: kColorScheme.appBarContrast,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
