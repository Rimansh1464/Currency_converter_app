
import 'package:currency_converter_app/provider/api_provider.dart';
import 'package:currency_converter_app/provider/theme_provider.dart';
import 'package:currency_converter_app/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(create:(context)=>ThemeProvider() ),
    ChangeNotifierProvider<CurrencyProvider>(
      create: (context) => CurrencyProvider(),

      builder: (context, _) => MaterialApp(
        theme: ThemeData(
            backgroundColor: Color(0xFF254B62),
            buttonColor: Color(0xFF000000),
            cardColor: Color(0xfffffdfd)),
        darkTheme: ThemeData(
            backgroundColor: Color(0xff2b2d3c),
            buttonColor: Color(0xFFFFFFFF),
            cardColor: Color(0xff54545b)),
        themeMode:  (Provider.of<ThemeProvider>(context).isDark) ? ThemeMode.dark : ThemeMode.light,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    ),
  ]));
}
