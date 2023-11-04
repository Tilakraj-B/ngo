import 'package:flutter/material.dart';
import 'package:ngo/features/presentation/widgets/image_list_view.dart';

import '../../data/model/product.dart';

class ProductCard extends StatefulWidget {
  ProductModel product;
  ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageListView(
            imageUrl: widget.product.product_pictures_before,
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
              width: 300,
              child: Text(widget.product.product_title ?? "NO Title")),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
              width: 300,
              child: Text(widget.product.product_category ?? "No Catgory")),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 300,
            child: Text(
              widget.product.product_description_before ?? "NO Description",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ));
  }
}
