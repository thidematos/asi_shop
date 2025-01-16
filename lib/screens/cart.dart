import 'package:asi_shop/providers/user_provider.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:asi_shop/widget/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'AsiCarrinho',
        asipoints: ref.watch(userProvider).asipoints,
        useActions: false,
      ).mainAppBarWidget,
      body: Text(
        'Oi cuzinho',
        style: kTextStyles.bodyText.copyWith(
          fontSize: 48,
        ),
      ),
    );
  }
}
