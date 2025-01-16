import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:asi_shop/providers/filters_provider.dart';
import 'package:asi_shop/providers/user_provider.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:asi_shop/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filters extends ConsumerStatefulWidget {
  const Filters({super.key});

  @override
  ConsumerState<Filters> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends ConsumerState<Filters> {
  @override
  Widget build(BuildContext context) {
    final avaliableProducts = ref.watch(avaliableProductsProvider);
    final asipoints = ref.watch(userProvider).asipoints;
    final filters = ref.watch(filtersProvider);

    final filteredProducts =
        avaliableProducts.where((product) => product.price <= asipoints);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          spacing: 10,
          children: [
            Switch(
              value: filters[Filter.affordable]!,
              activeColor: kColorScheme.appBarBackground,
              onChanged: (value) => ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.affordable),
            ),
            Text(
              'Posso comprar',
              style: kTextStyles.bodyText.copyWith(
                  color: filters[Filter.affordable]!
                      ? kColorScheme.appBarBackground
                      : kColorScheme.black),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Switch(
              value: filters[Filter.favorite]!,
              activeColor: kColorScheme.appBarBackground,
              onChanged: (value) => ref
                  .read(filtersProvider.notifier)
                  .toggleFilter(Filter.favorite),
            ),
            Text(
              'Favoritos',
              style: kTextStyles.bodyText.copyWith(
                color: filters[Filter.favorite]!
                    ? kColorScheme.appBarBackground
                    : kColorScheme.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
