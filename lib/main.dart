import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import './Services/authentication.dart';
import './Authentication Pages/root_page.dart';
import 'package:provider/provider.dart';
import './Tabs/SettingsScreen/SettingsScreen.dart';
import 'Tabs/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/global/theme/bloc/bloc.dart';

=======
import './Authentication Pages/Services/authentication.dart';
import './Authentication Pages/Views/root_page.dart';
>>>>>>> master

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.cyan,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Toto',
          theme: theme,
          home: new RootPage(auth: Auth()),
        );
      }
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       builder: (context) => ThemeBloc(),
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: _buildWithTheme,
//       ),
//     );
//   }

//   Widget _buildWithTheme(BuildContext context, ThemeState state) {
//     return MaterialApp(
//       title: 'Material App',
//       home: RootPage(auth: Auth()),
//       theme: state.themeData,
//     );
//   }
// }




