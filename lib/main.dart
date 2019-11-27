import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Authentication Pages/Services/authentication.dart';
import './Authentication Pages/Views/root_page.dart';
import 'Tabs/SettingsScreen/Widgets/ThemeChanger.dart';

/// Runs the application
void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Toto',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.cyan,
//         ),
//         home: RootPage(auth: Auth()));
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new DynamicTheme(
//       defaultBrightness: Brightness.light,
//       data: (brightness) => new ThemeData(
//         primarySwatch: Colors.cyan,
//         brightness: brightness,
//       ),
//       themedWidgetBuilder: (context, theme) {
//         return new MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Toto',
//           theme: theme,
//           home: new RootPage(auth: Auth()),
//         );
//       }
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          builder: (_) => ThemeChanger(),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toto',
      theme: themeChanger.theme,
      home: RootPage(auth: Auth()),
    );
  }
}





