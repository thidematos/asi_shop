import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Fallback extends StatelessWidget {
  const Fallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
      child: Column(
        spacing: 10,
        children: [
          Image.asset('assets/tony.png'),
          Text(
            'Nenhum AsiProduto disponível...',
            textAlign: TextAlign.center,
            style: kTextStyles.bodyText.copyWith(
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
