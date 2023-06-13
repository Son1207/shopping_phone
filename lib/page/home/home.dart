import 'package:flutter/material.dart';
import 'package:shopping_food/page/home/widget/home_category.dart';
import 'package:shopping_food/page/home/widget/home_slider.dart';

class HomePage extends StatelessWidget {
  static const routerName ='/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: const[
          HomeSlider(),
          SizedBox(height: 20,),
          HomeCategory(),

        ],
      ),
    );
  }
}
