import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/models/category/index.dart';
import 'package:ehlel/widgets/product_list.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  final CategoryModel item;

  const CategoryProducts(this.item, {Key? key}) : super(key: key);

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCategoryProducts(widget.item.id));
  }

  @override
  Widget build(BuildContext context) {
    return ProductList(widget.item.products ?? []);
  }
}
