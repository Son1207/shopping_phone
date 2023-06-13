import 'package:flutter/material.dart';
import 'package:shopping_food/page/home/widget/home_category.dart';
import 'package:shopping_food/page/home/widget/home_slider.dart';

import '../../const.dart';

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
        children: [
          const HomeSlider(),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Danh mục sản phẩm',
                  style: fdCategory,
                ),
                Text('Tất cả (4)'),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const HomeCategory(),

        ],
      ),
    );
  }
}
