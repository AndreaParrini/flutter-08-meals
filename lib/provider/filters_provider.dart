import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'package:meals/provider/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
        Filter.lactoseFree: false,
      });

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // ! NOT ALLOWED!! => mutating state end it is not possible in these providers
    state = {...state, filter: isActive};
  }

  void setAllFilters(Map<Filter, bool> chooseFilters) {
    state = chooseFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilter = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
