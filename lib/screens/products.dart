import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/main_app_bar.dart';
import 'package:asi_shop/widget/products/filters.dart';
import 'package:asi_shop/widget/products/products_list.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filters(),
        ProductsList(),
      ],
    );
  }
}
