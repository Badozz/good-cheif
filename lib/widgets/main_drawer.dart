import 'package:flutter/material.dart';
import 'package:resturant/pages/settings_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData iconData, Function onTap) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              border: Border.all(color: Colors.red),
            ),
            child: Text(
              'Let us Sheif !!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(context, Settings.routeName);
            },
          ),
        ],
      ),
      elevation: 5,
    );
  }
}
