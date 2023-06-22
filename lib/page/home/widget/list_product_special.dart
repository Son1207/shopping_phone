import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/product_provider.dart';

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProductSpecial(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data! as List;
          return snapshot.hasData
              ? ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage('${data[index].image}'),
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        '${data[index].name}',
                        maxLines: 2,
                      ),
                      subtitle: Text(intl.NumberFormat.simpleCurrency(
                              locale: 'vi', decimalDigits: 0)
                          .format(data[index].price)
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                            onTap: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addCart(data[index].id, data[index].image,
                                      data[index].name, data[index].price);
                            },
                            child: const Icon(Icons.shopping_cart_checkout),
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      height: 1,
                    );
                  }),
                  itemCount: data.length,
                )
              : const Center(
                  child: Text('Empty Product'),
                );
        },
      ),
    );
  }
}
