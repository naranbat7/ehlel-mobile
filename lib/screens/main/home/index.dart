import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/widgets/page_loader.dart';
import 'package:ehlel/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetProductList());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return provider.products.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Text(
                      'Онцлох бүтээгдэхүүн',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: ProductList(provider.products)),
                ],
              )
            : const PageLoader();
      },
    );
  }
}
