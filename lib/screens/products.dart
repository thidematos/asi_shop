import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/main_app_bar.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().mainAppBarWidget,
    );
  }
}
