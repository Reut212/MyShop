import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          backgroundColor: Colors.white30,
          leading: IconButton(
            icon: Icon(Icons.currency_exchange),
            onPressed: () {},
            color: Colors.pink,
          ),
          title: Text(
            '${product.price}',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Colors.pink,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
          ),
          trailing: IconButton(
            icon: Icon((Icons.shopping_cart)),
            onPressed: () {},
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
