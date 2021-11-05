import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/restaurants_provider.dart';
import './providers/categories_provider.dart';
import './providers/cuisine_provider.dart';
import './providers/meals_provider.dart';
import './providers/orders_provider.dart';
import './providers/speciality_provider.dart';
import './providers/cart_provider.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/basket_screen.dart';
import './screens/checkout_screen.dart';
import './screens/order_tracking_screen.dart';
import './screens/details_screen.dart';
import './screens/filters_screen.dart';
import './screens/favorites_screen.dart';
import './screens/about_screen.dart';
import './screens/menu_tabs.dart';
import './screens/bookings_screen.dart';
import './screens/coffee_details_page.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  List<Meal> availableMeals = MealsProvider().getMeals;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      widget.availableMeals = widget.availableMeals.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) {
      meal.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          widget.availableMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Meal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CuisineProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RestaurantsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MealsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SpecialityProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'The FoodCourt',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.green,
          canvasColor: Colors.transparent,
          //fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              )),
        ),
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => HomeScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          //MealsTab.routeName: (ctx) => MealsTab(widget.favoriteMeals),
          MenuTabs.routeName: (ctx) => MenuTabs(),
          BookingsScreen.routeName: (ctx) => BookingsScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(widget.availableMeals),
          DetailsScreen.routeName: (ctx) => DetailsScreen(),
          BasketScreen.routeName: (ctx) => BasketScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          CoffeeDetailsPage.routeName: (ctx) => CoffeeDetailsPage(),
          OrderTrackingScreen.routeName: (ctx) => OrderTrackingScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
          AboutScreen.routeName: (ctx) => AboutScreen(),
          //  _isMealFavourite),
          FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
        },
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Map<String, bool> _filters = {
//     'gluten': false,
//     'lactose': false,
//     'vegan': false,
//     'vegetarian': false,
//   };

//   final menuData =  MenuProvider();
//    List<Meal> mealsList = menuData.getMeals;
//   List<Meal> _availableMeals = mealsList;
//   List<Meal> _favourateMeals = [];

//   void _setFilters(Map<String, bool> filterData) {
//     setState(() {
//       _filters = filterData;

//       _availableMeals = mealsList.where((meal) {
//         if (_filters['gluten'] && !meal.isGlutenFree) {
//           return false;
//         }
//         if (_filters['vegan'] && !meal.isVegan) {
//           return false;
//         }
//         if (_filters['vegetarian'] && !meal.isVegetarian) {
//           return false;
//         }
//         if (_filters['lactose'] && !meal.isLactoseFree) {
//           return false;
//         }
//         return true;
//       }).toList();
//     });
//   }

//   void _toggleFvourites(String mealId){
//    final existingIndex =  _favourateMeals.indexWhere((meal) {
//      meal.id == mealId;
//    });
//    if(existingIndex >= 0){
//      setState(() {
//        _favourateMeals.removeAt(existingIndex);
//      });
//    } else {
//      setState((){
//        _favourateMeals.add(
//          mealsList.firstWhere((meal) => meal.id == mealId),
//        );
//      });
//    }
//   }

//
//   @override
//   Widget build(BuildContext context) {
//    return ChangeNotifierProvider(
//       create: (ctx) => MenuProvider(),
//       child: MaterialApp(
//         title: 'Zest Meals',
//         theme: ThemeData(
//           primarySwatch: Colors.amber,
//           accentColor: Colors.green,
//           canvasColor: Colors.amber[200],
//           //fontFamily: 'Raleway',
//           textTheme: ThemeData.light().textTheme.copyWith(
//               body1: TextStyle(
//                 color: Color.fromRGBO(20, 51, 51, 1),
//               ),
//               body2: TextStyle(
//                 color: Color.fromRGBO(20, 51, 51, 1),
//               ),
//               title: TextStyle(
//                 fontSize: 20,
//                 //  fontFamily: 'RobotoCondensed',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
//               )),
//         ),
//         // home: CategoriesScreen(),
//         initialRoute: '/', // default is '/'
//         routes: {
//          '/': (ctx) => LoginPage(),
//          TabsScreen.routeName:
//              (ctx) => TabsScreen(_favourateMeals),
//           CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
//           MealDetailScreen.routeName: (ctx) => MealDetailScreen(
//           _toggleFvourites, _isMealFavourite),
//           FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
//         },

//         //onGenerateRoute method below helps when, there is an error
//         //loading any screen. It will redirect the user to a screen of
//         //your choice instead of an error message or blank screen.
//         //it works perfectly when using routes that are generated dynamically
//         //that you cant preset during development

//         // onGenerateRoute: (settings) {
//         //   print(settings.arguments);
//         //   //using settings, you can access routes info like
//         //   //route name like settings.name
//         //   return MaterialPageRoute (builder: (ctx) => CategoriesScreen(),
//         //   );
//         // },
//         //as an alternative to onGnerated you can use onUnknownRoute method
//         //to create a fallback screen,
//         //to avoid your users from seeing your app crushing
//         //you can use both and the onUnknown
//         //will be like your last resort if everything else didnt work

//         onUnknownRoute: (settings) {
//           return MaterialPageRoute(
//             builder: (ctx) => TabsScreen(_favourateMeals),
//           );
//         }
//     ),
//   );
//   }
// }
