import 'package:asi_shop/providers/avaliable_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { affordable, favorite }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.affordable: false,
          Filter.favorite: false,
        });

  void toggleFilter(Filter filter) {
    state = {...state, filter: !state[filter]!};
    print(state);
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
