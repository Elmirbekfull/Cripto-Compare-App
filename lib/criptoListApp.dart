import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

class CriptoCurrenciesListApp extends StatelessWidget {
  const CriptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CriptoCurrenciesList',
        theme: darkTheme,
        // Navigator
        routes: routes);
  }
}
