import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/page/category/category.dart';

import '../../../providers/category_provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future categoryFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    categoryFuture = Provider.of<CategoryProvider>(context).getCategory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryFuture,
      initialData: const [],
      builder: (context, asyncData) {
        var categoryData = [];
        if (asyncData.hasData) {
          categoryData = asyncData.data! as List;
        } else {
          return Container(
            child: Text(asyncData.error.toString()),
          );
        }
        return SizedBox(
          height: 70,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CategoryPage.routerName,
                    arguments: {
                      'id': categoryData[index].id,
                      'name': categoryData[index].name,
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: const [],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(categoryData[index].image),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(categoryData[index].name),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
