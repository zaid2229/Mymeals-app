import 'package:my_meals/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
