import 'package:flutter/material.dart';
import 'package:resturant/widgets/main_drawer.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';
  final Function savedFilters;
  final Map<String, bool> currentFilters;
  Settings(this.currentFilters, this.savedFilters);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _vegan = false;
  bool _isGlutenFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subTilte, bool value, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTilte),
        value: value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _vegan,
                };

                widget.savedFilters(selectedFilters);
              },
            ),
          ],
          title: Text('Settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Text(
                'Picke up Your Meals ',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-Free', 'only gluten-free meals', _isGlutenFree,
                      (newVal) {
                    setState(() {
                      _isGlutenFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-Free', 'only lactose-free meals', _isLactoseFree,
                      (newVal) {
                    setState(() {
                      _isLactoseFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'vegetarian', 'only vegetarian meals', _isVegetarian,
                      (newVal) {
                    setState(() {
                      _isVegetarian = newVal;
                    });
                  }),
                  _buildSwitchListTile('Vegan', 'only vegan meals', _vegan,
                      (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
