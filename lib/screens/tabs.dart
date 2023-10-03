import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals/screens/categories.dart';
import 'package:my_meals/screens/filters.dart';
import 'package:my_meals/screens/meals_screen.dart';
import 'package:my_meals/widgets/main_drawer.dart';
import 'package:my_meals/providers/fevorites_provider.dart';
import 'package:my_meals/providers/filters_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFreee: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StateTabs();
  }
}

class _StateTabs extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => const FiltersScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            _selectPage(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fastfood_outlined,
                ),
                activeIcon: Icon(Icons.fastfood),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_rounded,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorites')
          ],
        ));
  }
}
