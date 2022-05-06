import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/widgets/button.dart';
import 'package:ehlel/widgets/page_loader.dart';
import 'package:ehlel/widgets/product_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _bloc = MainBloc();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCart());
  }

  _saveCart() {
    _bloc.add(UpdateCart());
  }

  _createOrder() {
    Navigator.pushNamed(context, addOrderRoute);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainBloc, MainState>(
          bloc: _bloc,
          listener: (context, state) async {
            if (state is MainLoading) {
              setState(() {
                loading = true;
              });
            }
            if (state is MainSuccessful) {
              setState(() {
                loading = false;
              });
            }
            if (state is MainFailure) {
              setState(() {
                loading = false;
              });
            }
          },
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        bloc: _bloc,
        builder: (context, state) {
          return Consumer<MainProvider>(
            builder: (context, provider, child) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Сагс'),
                  centerTitle: true,
                ),
                persistentFooterButtons: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Button(title: 'Хадгалах', onPress: _saveCart),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Button(title: 'Захиалах', onPress: _createOrder),
                      ),
                    ],
                  )
                ],
                body: !loading
                    ? (provider.cart.products ?? []).isNotEmpty
                        ? Scrollbar(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: provider.cart.products!.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.7,
                                ),
                                itemBuilder: (BuildContext context, int index) => ProductCartCard(
                                  item: provider.getProductById(provider.cart.products![index].product ?? ''),
                                  quantity: provider.cart.products![index].quantity ?? 0,
                                ),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text('Хоосон байна'),
                          )
                    : const PageLoader(),
              );
            },
          );
        },
      ),
    );
  }
}
