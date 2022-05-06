import 'package:ehlel/models/product/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel item;

  const ProductDetailPage(this.item, {Key? key}) : super(key: key);

  _onPress(context) {
    Navigator.pushNamed(context, cartRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бүтээгдэхүүн'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, cartRoute),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _onPress(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            child: const Text(
              'Сагсанд нэмэх',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.id,
                    child: Image.network(
                      item.primaryImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // Text(
                  //   item.category?.categoryName ?? '',
                  //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  // ),
                  const SizedBox(height: 10),
                  Text(
                    item.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.priceUSD.toString(),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Тайлбар",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  ...List.generate(
                    (item.description ?? []).length,
                    (idx) => Text(
                      item.description![idx],
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.features ?? '',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
