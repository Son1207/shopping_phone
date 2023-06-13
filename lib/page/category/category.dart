import 'package:flutter/material.dart';
import 'package:shopping_food/page/category/widget/category_body.dart';

class CategoryPage extends StatelessWidget {
  static const routerName = '/category';

  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg['name']),
      ),
      body: const CategoryBody(),
    );
  }
}
