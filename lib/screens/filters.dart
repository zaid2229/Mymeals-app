import 'package:flutter/material.dart';
import 'package:my_meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFreee,
  vegetarian,
  vegan,
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filter_provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filter_provider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFreee]!,
            onChanged: (isChecked) {
              ref
                  .read(filter_provider.notifier)
                  .setFilter(Filter.lactoseFreee, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filter_provider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filter_provider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Only Vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          ),
        ],
      ),
    );
  }
}
