import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals/models/meals.dart';
import 'package:my_meals/providers/fevorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(favoriteMealsProvider);
    final favMeal = filteredMeals.contains(meal);
    print(favMeal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealsFavoriteStatus(meal);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(wasAdded
                          ? 'Meal added as a favorite'
                          : 'Meal removed')),
                );
                print(favMeal);
              },
              icon:
                  // AnimatedSwitcher(
                  //   duration: const Duration(milliseconds: 300),
                  //   transitionBuilder: (child, animation) {
                  //     return RotationTransition(
                  //         turns:
                  //             Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                  //         child: child);
                  //   },
                  //   child: Icon(
                  //     favMeal ? Icons.favorite : Icons.favorite_border_outlined,
                  //     key: ValueKey(favMeal),
                  //   ),
                  // ),
                  AnimatedCrossFade(
                firstChild: const Icon(
                  Icons.favorite_border_outlined,
                  key: ValueKey(false),
                ),
                secondChild: const Icon(
                  Icons.favorite,
                  key: ValueKey(true),
                ),
                duration: const Duration(milliseconds: 500),
                crossFadeState: favMeal
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
