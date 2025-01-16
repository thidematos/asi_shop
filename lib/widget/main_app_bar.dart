import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MainAppBar {
  MainAppBar({
    required this.title,
    required this.asipoints,
    this.useActions = true,
    required this.goTo,
  }) : mainAppBarWidget = AppBar(
          iconTheme:
              IconThemeData().copyWith(color: kColorScheme.appBarContrast),
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
                title.toUpperCase(),
                style: kTextStyles.appBar,
              )
            ],
          ),
          actions: useActions
              ? [
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
                          asipoints.toString(),
                          style: kTextStyles.appBar.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: IconButton(
                      onPressed: () {
                        goTo();
                      },
                      icon: Icon(
                        Icons.shopping_cart_checkout_sharp,
                        color: kColorScheme.appBarContrast,
                        size: 28,
                      ),
                    ),
                  )
                ]
              : null,
        );

  final String title;
  final int asipoints;
  final void Function() goTo;
  bool useActions;

  AppBar mainAppBarWidget;
}
