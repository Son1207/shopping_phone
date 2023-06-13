import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/page/category/category.dart';
import 'package:shopping_food/page/home/home.dart';
import 'package:shopping_food/page/product/product.dart';
import 'package:shopping_food/providers/category_provider.dart';
import 'package:shopping_food/providers/slider_provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SliderProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (context) => const HomePage(),
        CategoryPage.routerName: (context) => const CategoryPage(),
        ProductPage.routerName: (context) => const ProductPage(),
      },
    ),
  ));
}
