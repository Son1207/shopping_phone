import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/page/home/home.dart';
import 'package:shopping_food/providers/slider_provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SliderProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (context) => const HomePage(),
      },
    ),
  ));
}
