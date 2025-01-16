import 'package:asi_shop/screens/products.dart';
import 'package:asi_shop/screens/tabs.dart';
import 'package:asi_shop/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: App(),
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kColorScheme.scaffoldBackground,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.appBarBackground,
            toolbarHeight: 85,
          ),
        ),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TabsScreen();
  }
}
