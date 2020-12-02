import 'package:flutter/material.dart';
import '../pages/categories_meals_screen.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imgUrl;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CateoriesMealsScreen.routeName,
      arguments: {'id': id, 'title': title, 'imgUrl': imgUrl},
    );
  }

  CategoriesItem(this.id, this.title, this.color, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imgUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black45,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
