import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Model that handles the data and logic for the homePage portion
class LevelModel with ChangeNotifier {
  // Water level defined in pixels. Currently the hegiht of the container is 375
  double _waterLevel = 300;
  double _foodLevel = 300;
  Color _waterBorder = Colors.black;
  Color _foodBorder = Colors.black;

  double get waterLevel => _waterLevel;
  double get foodLevel => _foodLevel;
  Color get waterBorder => _waterBorder;
  Color get foodBorder => _foodBorder;


  set waterLevel(double value) {
    if (_waterLevel <= 30) {
      _waterLevel = _waterLevel;
      _waterBorder = Colors.red;
      notifyListeners();
      print("Water level is about to be under 20");
    }
    else if (_waterLevel <= 132 && _waterLevel > 30) {
      _waterLevel = value;
      _waterBorder = Colors.yellow;
      notifyListeners();
    }
    else {
      _waterLevel = value;
      _waterBorder = Colors.green;
      notifyListeners();
      print("Current water level is ${_waterLevel/375 * 100}%");
    }
  }

  set foodLevel(double value) {
    if (_foodLevel <= 30) {
      _foodLevel = _foodLevel;
      _foodBorder = Colors.red;
      notifyListeners();
      print("Food level is about to be under 20");
    }
    else if (_foodLevel <= 132 && _foodLevel > 30) {
      _foodLevel = value;
      _foodBorder = Colors.yellow;
      notifyListeners();
    }
    else {
      _foodBorder = Colors.green;
      _foodLevel = value;
      notifyListeners();
    }
    print("Current food level is ${_foodLevel/375 * 100}");
  }
}