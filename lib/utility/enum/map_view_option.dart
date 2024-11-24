import 'package:flutter/material.dart';

enum MapViewOption {
  cycle,
  shopping,
  resturant;

  String get title {
    switch (this) {
      case MapViewOption.cycle:
        return "Cycle";
      case MapViewOption.shopping:
        return "Shopping";
      case MapViewOption.resturant:
        return "Resturant";
    }
  }

  IconData get buttonIcon {
    switch (this) {
      case MapViewOption.cycle:
        return Icons.pedal_bike_rounded;
      case MapViewOption.shopping:
        return Icons.shopping_bag_rounded;
      case MapViewOption.resturant:
        return Icons.restaurant_menu_rounded;
    }
  }
}
