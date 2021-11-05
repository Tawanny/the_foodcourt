import 'package:flutter/foundation.dart';

class SpecialityItem {
  final String id;
  final String title;
  final String imageUrl;

  SpecialityItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });
}

class SpecialityProvider with ChangeNotifier {
  List<SpecialityItem> _items = [
    SpecialityItem(
      id: 'm2',
      title: 'Fathers Day',
      imageUrl: 'assets/images/fathersday.jpg',
    ),
    SpecialityItem(
      id: 'm3',
      title: 'Build Your Burger',
      imageUrl: 'assets/images/buildyourown.jpg',
    ),
    SpecialityItem(
      id: 'm4',
      title: 'Pizza Special',
      imageUrl: 'assets/images/pizzaspecial.jpg',
    ),
    SpecialityItem(
      id: 'm5',
      title: 'Live Music at Zest',
      imageUrl: 'assets/images/liveMusicAd.jpg',
    ),
  ];

  List<SpecialityItem> get getItems {
    return _items;
  }

  int get getItemCount {
    return _items.length;
  }
}
