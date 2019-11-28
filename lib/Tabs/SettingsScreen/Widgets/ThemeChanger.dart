import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  bool _notificationSelected;
  bool _darkSelected;
  SharedPreferences _prefs;
  static const String _themeField = 'theme';
  static const int _lightThemeInt = 0;
  static const int _darkThemeInt = 1;

  final _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.cyan,
    accentColor: Colors.deepOrange,
    canvasColor: Colors.cyan,
    primaryIconTheme: IconThemeData(color: Colors.black),
  );

  final _darkTheme = ThemeData.dark().copyWith(
    //primaryColor: Colors.black54,
    accentColor: Colors.deepOrange,
    canvasColor: Colors.grey[900],
    primaryIconTheme: IconThemeData(color: Colors.white),
  ); 

  ThemeChanger() {
    _notificationSelected = false;
    _darkSelected = false;
    _themeData = _lightTheme;
    asyncInit();
  }

  Future<void> asyncInit() async {
    _prefs = await SharedPreferences.getInstance();
    int theme = (_prefs.getInt(_themeField) ?? 0);
    if (theme == _lightThemeInt) {
      _themeData = _lightTheme;
    } else {
      _themeData = _darkTheme;
    }
    notifyListeners();
  }

  ThemeData get theme => _themeData;
  bool get notificationSelected => _notificationSelected;
  bool get darkSelected => _darkSelected;

  void switchTheme() {
    if (_themeData == _lightTheme) {
      _themeData = _darkTheme;
      _darkSelected = true;
      _prefs.setInt(_themeField, _darkThemeInt);
    } 
    else {
      _themeData = _lightTheme;
      _darkSelected = false;
      _prefs.setInt(_themeField, _lightThemeInt);
    }
    notifyListeners();
  }
}



// class DarkMode extends StatelessWidget {
//   const DarkMode({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         padding: EdgeInsets.all(8),
//         itemCount: AppTheme.values.length,
//         itemBuilder: (context, index) {
//           // Enums expose their values as a list - perfect for ListView
//           // Store the theme for the current ListView item
//           final itemAppTheme = AppTheme.values[index];
//           return Card(
//             // Style the cards with the to-be-selected theme colors
//             color: appThemeData[itemAppTheme].primaryColor,
//             child: ListTile(
//               title: Text(
//                 itemAppTheme.toString(),
//                 // To show light text with the dark variants...
//                 style: appThemeData[itemAppTheme].textTheme.body1,
//               ),
//               onTap: () {
//                 // This will make the Bloc output a new ThemeState,
//                 // which will rebuild the UI because of the BlocBuilder in main.dart
//                 BlocProvider.of<ThemeBloc>(context)
//                     .dispatch(ThemeChanged(theme: itemAppTheme));
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

