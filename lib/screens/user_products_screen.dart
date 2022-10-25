import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';

import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routName = 'user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productData.items[i].id,
                  productData.items[i].title,
                  productData.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
