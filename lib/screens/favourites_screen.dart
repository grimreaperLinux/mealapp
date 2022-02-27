import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('No favourites meals'),
      );
    }
    return Container(
        child: ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favouriteMeals[index].id,
          title: favouriteMeals[index].title,
          affordability: favouriteMeals[index].affordability,
          imageurl: favouriteMeals[index].imageUrl,
          complexity: favouriteMeals[index].complexity,
          duration: favouriteMeals[index].duration,
        );
      },
      itemCount: favouriteMeals.length,
    ));
  }
}
