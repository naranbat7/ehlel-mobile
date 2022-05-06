import 'package:ehlel/models/category/index.dart';
import 'package:ehlel/screens/main/products/category_products.dart';
import 'package:flutter/material.dart';

class ProductsCategories extends StatefulWidget {
  final List<CategoryModel> categories;

  const ProductsCategories(this.categories, {Key? key}) : super(key: key);

  @override
  State<ProductsCategories> createState() => _ProductsCategoriesState();
}

class _ProductsCategoriesState extends State<ProductsCategories> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.black87,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(right: 20, left: 20),
          unselectedLabelColor: const Color(0xFFCDCDCD),
          tabs: List.generate(
            widget.categories.length,
            (idx) => Tab(
              child: Text(
                widget.categories[idx].categoryName ?? '',
                style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: List.generate(
              widget.categories.length,
              (idx) => CategoryProducts(widget.categories[idx]),
            ),
          ),
        ),
      ],
    );
  }
}
