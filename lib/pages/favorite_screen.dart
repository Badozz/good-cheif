import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meals> faviroteMeals;
  FavoriteScreen(this.faviroteMeals);
  @override
  Widget build(BuildContext context) {
    if (faviroteMeals.isEmpty) {
      return Center(
        child: Text('No favirote meals yet - add some'),
      );
    } else
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: faviroteMeals[index].id,
            title: faviroteMeals[index].title,
            imageUrl: faviroteMeals[index].imageUrl,
            affordability: faviroteMeals[index].affordability,
            complexity: faviroteMeals[index].complexity,
            duration: faviroteMeals[index].duration,
          );
        },
        itemCount: faviroteMeals.length,
      );
  }
}
