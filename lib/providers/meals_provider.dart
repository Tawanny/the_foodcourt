import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/helper.dart';

class MealsProvider with ChangeNotifier {
  final List<Meal> _meals = [
    Meal(
      id: 'meal1',
      categories: [
        'c1',
        'c5',
      ],
      title: 'Bacon&Mushroom Afredo',
      price: 90.00,
      imageUrl: 'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
      duration: 20,
      description: [
        'Diced bacon and mushrooms',
        'mixed with a creamy pasta',
        'topped with some permesan shavings',
      ],
      isGlutenFree: false,
      isVegan: true,
      isVegetarian: true,
      isLactoseFree: true,
    ),
    Meal(
      id: 'meal2',
      categories: [
        'c9',
      ],
      title: 'Chicken Wrap',
      price: 79.00,
      imageUrl: 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=764&q=80',
      duration: 10,
      description: [
        'Grilled chicken and bacon',
        'avo slices and baby marrows',
        'with a creamy mayo',
        'wrapped in a soft tortila wrap',
      ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    ),
    Meal(
      id: 'meal3',
      categories: [
        'c3',
      ],
      title: 'Chicken Salad',
      price: 125.00,
      imageUrl: 'https://images.unsplash.com/photo-1512852939750-1305098529bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
      duration: 45,
      description: [
        'Chicken Grilled to perfection',
        'served in a fresh bed of greek salad',
      ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: true,
    ),
    Meal(
      id: 'meal4',
      categories: [
        'c7',
      ],
      title: 'Chicken Schnitzel',
      price: 90.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      duration: 60,
      description: [
        'Crumbed Chicken breast',
        'deep fried till golden',
        'served with chips or salad',
      ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    ),
    Meal(
      id: 'meal5',
      categories: [
        'c4',
      ],
      title: 'Smoked Salmon Salad',
      price: 145.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      duration: 15,
      description: [
        '200g of smoked salmon',
        'served on bed of crispy fresh lettuce'
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm1',
      categories: [
        'c1',
        'c5',
      ],
      title: 'Spaghetti ',
      price: 90.00,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      duration: 20,
      description: [
        '4 Tomatoes',
        '1 Tablespoon of Olive Oil',
        '1 Onion',
        '250g Spaghetti',
        'Spices',
        'Cheese (optional)'
      ],
      // steps: [
      //   'Cut the tomatoes and the onion into small pieces.',
      //   'Boil some water - add salt to it once it boils.',
      //   'Put the strue,

      //   'In the meantime, heaten up some olive oil and add the cut onion.',
      //   'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      //   'The sauce will be done once the spaghetti are.',
      //   'Feel free to add some cheese on top of the finished dish.'
      // ],
      isGlutenFree: false,
      isVegan: true,
      isVegetarian: true,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm2',
      categories: [
        'c9',
      ],
      title: 'Toast Hawaii',
      price: 50.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      duration: 10,
      description: [
        '1 Slice White Bread',
        '1 Slice Ham',
        '1 Slice Pineapple',
        '1-2 Slices of Cheese',
        'Butter'
      ],
      // steps: [
      //   'Butter one side of the white bread',
      //   'Layer ham, the pineapple and cheese on the white bread',
      //   'Bake the toast for round about 10 minutes in the oven at 200°C'
      // ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm3',
      categories: [
        'c3',
      ],
      title: 'Zest Burger',
      price: 125.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      duration: 45,
      description: [
        '300g Cattle Hack',
        '1 Tomato',
        '1 Cucumber',
        '1 Onion',
        'Ketchup',
        '2 Burger Buns'
      ],
      // steps: [
      //   'Form 2 patties',
      //   'Fry the patties for c. 4 minutes on each side',
      //   'Quickly fry the buns for c. 1 minute on each side',
      //   'Bruch buns with ketchup',
      //   'Serve burger with tomato, cucumber and onion'
      // ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm4',
      categories: [
        'c7',
      ],
      title: 'Chicken Schnitzel',
      price: 90.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      duration: 60,
      description: [
        'Crumbed Chicken breast',
        'deep fried till golden',
        'served with chips or salad'
      ],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm5',
      categories: [
        'c4',
      ],
      title: 'Smoked Salmon Salad',
      price: 145.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      duration: 15,
      description: [
        '200g of smoked salmon',
        'served on bed of crispy fresh lettuce'
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm6',
      categories: [
        'c10',
      ],
      title: 'Orange Mousse',
      price: 70.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
      duration: 240,
      description: [
        '4 Sheets of Gelatine',
        '150ml Orange Juice',
        '80g Sugar',
        '300g Yoghurt',
        '200g Cream',
        'Orange Peel',
      ],
      // steps: [
      //   'Dissolve gelatine in pot',
      //   'Add orange juice and sugar',
      //   'Take pot off the stove',
      //   'Add 2 tablespoons of yoghurt',
      //   'Stir gelatin under remaining yoghurt',
      //   'Cool everything down in the refrigerator',
      //   'Whip the cream and lift it under die orange mass',
      //   'Cool down again for at least 4 hours',
      //   'Serve with orange peel',
      // ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm7',
      categories: [
        'c9',
      ],
      title: 'Pancakes',
      price: 40.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
      duration: 20,
      description: [
        '1 1/2 Cups all-purpose Flour',
        '3 1/2 Teaspoons Baking Powder',
        '1 Teaspoon Salt',
        '1 Tablespoon White Sugar',
        '1 1/4 cups Milk',
        '1 Egg',
        '3 Tablespoons Butter, melted',
      ],
      // steps: [
      //   'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      //   'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      //   'Heat a lightly oiled griddle or frying pan over medium high heat.',
      //   'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
      // ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm8',
      categories: [
        'c7',
      ],
      title: ' Indian Chicken Curry',
      price: 130.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
      duration: 35,
      description: [
        '4 Chicken Breasts',
        '1 Onion',
        '2 Cloves of Garlic',
        '1 Piece of Ginger',
        '4 Tablespoons Almonds',
        '1 Teaspoon Cayenne Pepper',
        '500ml Coconut Milk',
      ],
      // steps: [
      //   'Slice and fry the chicken breast',
      //   'Process onion, garlic and ginger into paste and sauté everything',
      //   'Add spices and stir fry',
      //   'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      //   'Add coconut milk',
      //   'Serve with rice'
      // ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm9',
      categories: [
        'c9',
      ],
      title: 'Chocolate Souffle',
      price: 70.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
      duration: 45,
      description: [
        '1 Teaspoon melted Butter',
        '2 Tablespoons white Sugar',
        '2 Ounces 70% dark Chocolate, broken into pieces',
        '1 Tablespoon Butter',
        '1 Tablespoon all-purpose Flour',
        '4 1/3 tablespoons cold Milk',
        '1 Pinch Salt',
        '1 Pinch Cayenne Pepper',
        '1 Large Egg Yolk',
        '2 Large Egg Whites',
        '1 Pinch Cream of Tartar',
        '1 Tablespoon white Sugar',
      ],
      // steps: [
      //   'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      //   'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      //   'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      //   'Place chocolate pieces in a metal mixing bowl.',
      //   'Place bowl over a pan of about 3 cups hot water over low heat.',
      //   'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      //   'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      //   'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      //   'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      //   'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      //   'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      //   'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      //   'Transfer a little less than half of egg whites to chocolate.',
      //   'Mix until egg whites are thoroughly incorporated into the chocolate.',
      //   'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      //   'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      //   'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
      // ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm10',
      categories: [
        'c4',
      ],
      title: 'Asparagus Salad ',
      price: 99.00,
      imageUrl: 'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
      duration: 30,
      description: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      // steps: [
      //   'Wash, peel and cut the asparagus',
      //   'Cook in salted water',
      //   'Salt and pepper the asparagus',
      //   'Roast the pine nuts',
      //   'Halve the tomatoes',
      //   'Mix with asparagus, salad and dressing',
      //   'Serve with Baguette'
      // ],
      isGlutenFree: true,
      isVegan: true,
      isVegetarian: true,
      isLactoseFree: true,
    ),
    Meal(
      id: 'm13',
      categories: [
        'c8',
      ],
      title: 'Cappucino',
      price: 26.00,
      imageUrl: Helper.getAssetName(
        "newcappuccino.jpg",
      ),
      duration: 5,
      description: [
        'Beautifully crafted double shot coffee',
        'with milk frothed to silkness',
        'and your favourite temperature,',
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm14',
      categories: [
        'c8',
      ],
      title: 'Caffe Latte',
      price: 30.00,
      imageUrl: Helper.getAssetName(
        "cafeLatte.jpg",
      ),
      duration: 5,
      description: [
        'Beautifully crafted double shot coffee',
        'with milk frothed to silkness',
        'and your favourite temperature,',
        'Coffee and milk beautifully layered in a tall glass',
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm15',
      categories: [
        'c8',
      ],
      title: ' Cappucino Grande ',
      price: 35.00,
      imageUrl: Helper.getAssetName(
        "newcappuccino.jpg",
      ),
      duration: 5,
      description: [
        'Beautifully crafted double shot coffee',
        'with milk frothed to silkness',
        'and your favourite temperature,',
        'In a 350ml cup',
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm16',
      categories: [
        'c8',
      ],
      title: 'Cappucino Cortado',
      price: 25.00,
      imageUrl: Helper.getAssetName(
        "cortado.jpg",
      ),
      duration: 5,
      description: [
        'Beautifully crafted double shot coffee',
        'with milk frothed to silkness',
        'and your favourite temperature,',
        'in 200ml cup'
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
    Meal(
      id: 'm17',
      categories: [
        'c8',
      ],
      title: 'Americano',
      price: 19.00,
      imageUrl: Helper.getAssetName(
        "americano.jpg",
      ),
      duration: 5,
      description: [
        'Beautifully crafted double shot coffee',
        'with milk frothed to silkness',
        'and your favourite temperature,',
        'in 200ml cup'
      ],
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
    ),
  ];

  List<Meal> get getMeals {
    return _meals;
  }

  Meal findById(String id) {
    return _meals.firstWhere((meal) => meal.id == id);
  }
}
