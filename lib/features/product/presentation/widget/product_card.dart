import 'package:ecoomerce_shop/features/product/domain/entity/product.dart';
import 'package:flutter/cupertino.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(product.image),
          Text(product.title),
        ],
      ),
    );
  }
  
}