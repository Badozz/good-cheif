import 'package:flutter/material.dart';
import 'package:resturant/12.1%20dummy_data.dart';
import 'package:resturant/models/meals.dart';
import './pages/settings_page.dart';
import './pages/categories_meals_screen.dart';
import './pages/meal_details.dart';
import './pages/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meals> _availableMeals = DUMMY_MEALS;
  List<Meals> _faviroteMeals = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavirote(String mealId) {
    final existingIndex =
        _faviroteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _faviroteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _faviroteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavirote(String mealId) {
    return _faviroteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_faviroteMeals),
        CateoriesMealsScreen.routeName: (context) =>
            CateoriesMealsScreen(_availableMeals),
        MealDetails.routeName: (context) => MealDetails(
              _toggleFavirote,
              _isMealFavirote,
            ),
        Settings.routeName: (context) => Settings(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
