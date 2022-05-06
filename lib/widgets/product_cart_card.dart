import 'package:ehlel/models/product/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:flutter/material.dart';

class ProductCartCard extends StatelessWidget {
  final ProductModel? item;
  final int quantity;

  const ProductCartCard({Key? key, this.item, this.quantity = 0}) : super(key: key);

  _onAdd() {
    if (item?.id != null) {
      MainProvider.provider.addCart(item!.id);
    }
  }

  _onRemove() {
    if (item?.id != null) {
      MainProvider.provider.removeCart(item!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Hero(
            tag: item?.id ?? '',
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(item?.primaryImage ?? ''),
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
                item?.title ?? '',
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
                (item?.priceUSD ?? 0).toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 9),
              Text("Ширхэг: $quantity"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: _onAdd,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  IconButton(
                    onPressed: _onRemove,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
