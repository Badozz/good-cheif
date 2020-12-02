import 'package:flutter/material.dart';

import 'package:resturant/models/meals.dart';
import 'package:resturant/widgets/meals_item.dart';

class CateoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meals> availableMeals;
  CateoriesMealsScreen(this.availableMeals);

  @override
  _CateoriesMealsScreenState createState() => _CateoriesMealsScreenState();
}

class _CateoriesMealsScreenState extends State<CateoriesMealsScreen> {
  String categoryTitle;
  List<Meals> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    // ignore: unused_local_variable
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = widget.availableMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
