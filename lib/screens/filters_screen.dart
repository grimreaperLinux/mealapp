import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filters';

  final Function savefilters;
  final Map<String, bool> currentfilters;

  FilterScreen(this.currentfilters, this.savefilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _lactoseFree = widget.currentfilters['lactose'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarian = widget.currentfilters['vegetarian'];
    super.initState();
  }

  Widget buildListTile(String title, String Description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(Description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedfilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.savefilters(selectedfilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildListTile('Gluten-Free', 'Only include Gluten free meals',
                      _glutenFree, (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  }),
                  buildListTile(
                      'Lactose-Free',
                      'Only include Lactose free meals',
                      _lactoseFree, (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  }),
                  buildListTile('Vegan', 'Only include Vegan meals', _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  buildListTile('Vegetarian', 'Only include Vegetarian meals',
                      _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
