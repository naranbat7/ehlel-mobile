import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/screens/main/products/categories.dart';
import 'package:ehlel/widgets/page_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCategoryList());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return provider.categories.isNotEmpty ? ProductsCategories(provider.categories) : const PageLoader();
      },
    );
  }
}
