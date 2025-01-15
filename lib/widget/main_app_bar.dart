import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MainAppBar {
  MainAppBar();

  final AppBar mainAppBarWidget = AppBar(
    title: Row(
      children: [
        Image.asset(
          'assets/logo-branca.png',
          height: 28,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'LOJA ASIMOV',
          style: kTextStyles.appBar,
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Row(
          children: [
            Icon(
              Icons.monetization_on,
              color: kColorScheme.appBarContrast,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              '55',
              style: kTextStyles.appBar
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_checkout_sharp,
            color: kColorScheme.appBarContrast,
            size: 28,
          ),
        ),
      )
    ],
  );
}
