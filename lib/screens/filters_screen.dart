import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../widgets/main_drawer.dart';
import './about_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _switchListTileBuilder(
    String title,
    String subtitle,
    bool currentValue,
    Function changeHandler,
  ) {
    return SwitchListTile(
      activeColor: Colors.amber,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: changeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust to your liking!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Meal Filters:',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.amber.withOpacity(0.5),
              ),
              _switchListTileBuilder(
                'Gluten-free',
                'Switch to show glutenfree meals only!',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _switchListTileBuilder(
                'Vegetarian',
                'Switch to show Vegetarian meals only!',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _switchListTileBuilder(
                'Vegan',
                'Switch to show Vegan meals only!',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _switchListTileBuilder(
                'Lactose-free',
                'Switch to show Lactose-free meals only!',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'App Settings:',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.amber.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 1,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(AboutScreen.routeName);
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.developer_board,
                      size: 36,
                      color: Colors.green,
                    ),
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: Colors.black),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
