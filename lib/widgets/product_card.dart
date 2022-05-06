import 'package:ehlel/models/product/index.dart';
import 'package:ehlel/screens/main/product_detail/index.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel item;

  const ProductCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(item)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: item.id,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(item.primaryImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title ?? '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                // const SizedBox(height: 8),
                // Text(
                //   item.category?.categoryName ?? '',
                //   textAlign: TextAlign.center,
                //   overflow: TextOverflow.ellipsis,
                //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                // ),
                const SizedBox(height: 9),
                Text(
                  item.priceUSD.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
