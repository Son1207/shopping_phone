import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  static const routerName = '/product';
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final product = data['data'];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name),
              background: Padding(
                padding: const EdgeInsets.all(60),
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  product.description,
                  maxLines: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text('1'),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Thêm Sản Phẩm'),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
