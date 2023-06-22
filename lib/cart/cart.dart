import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../helper/alert.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';

class CartPage extends StatefulWidget {
  static const routerName = '/cart';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void handleAddCart() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return alertLoading;
      }),
    );
    Future.delayed(
      const Duration(seconds: 3),
      (() {
        Provider.of<OrderProvider>(context, listen: false)
            .buy(Provider.of<CartProvider>(context, listen: false).items)
            .then(
              (value) => {
                if (value)
                  {
                    Navigator.pop(context),
                    showDialog(
                      context: context,
                      builder: ((context) {
                        return alertSuccess;
                      }),
                    ),
                    Provider.of<CartProvider>(context, listen: false)
                        .removeItems(),
                  },
              },
            );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang giỏ hàng'),
      ),
      body: itemsData.isNotEmpty
          ? Stack(
              children: [
                Positioned.fill(
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      var dataItem = value.items.values.toList();
                      return ListView.separated(
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Image(
                              image: NetworkImage(dataItem[index].image),
                              fit: BoxFit.fill,
                            ),
                            title: Text(
                              dataItem[index].name,
                              maxLines: 2,
                            ),
                            subtitle: Text(intl.NumberFormat.simpleCurrency(
                                    locale: 'vi', decimalDigits: 0)
                                .format(dataItem[index].price)),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .decrease(
                                              value.items.keys.toList()[index]);
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${dataItem[index].quantity}',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.blue),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .increase(
                                              value.items.keys.toList()[index]);
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (((context, index) {
                          return const Divider();
                        })),
                        itemCount: value.items.length,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: handleAddCart,
                      child: const Text('Xác nhận mua hàng'),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              child: Center(
                child: SvgPicture.asset('assets/images/svg/no-data.svg'),
              ),
            ),
    );
  }
}
