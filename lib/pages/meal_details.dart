import 'package:flutter/material.dart';
import 'package:resturant/12.1%20dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const String routeName = '/meal-details';
  final Function toggleFavirote;
  final Function isMealFavirote;
  MealDetails(
    this.toggleFavirote,
    this.isMealFavirote,
  );
  Widget titleLabel(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        'Ingrediants',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            titleLabel(context, 'Ingrediants'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                  color: Colors.red.shade100,
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            titleLabel(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavirote(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavirote(mealId),
      ),
    );
  }
}
