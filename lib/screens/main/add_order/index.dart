import 'package:ehlel/blocs/index.dart';
import 'package:ehlel/providers/index.dart';
import 'package:ehlel/services/dialog/index.dart';
import 'package:ehlel/utils/regex.dart';
import 'package:ehlel/widgets/address_tile.dart';
import 'package:ehlel/widgets/button.dart';
import 'package:ehlel/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({Key? key}) : super(key: key);

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _bloc = MainBloc();
  final _formKey = GlobalKey<FormState>();
  final _pointCtrl = TextEditingController(text: '0');
  int? _addressIdx;

  _onPress() {}

  _setAddress(int index) {
    setState(() {
      _addressIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainBloc, MainState>(
          bloc: _bloc,
          listener: (context, state) async {
            if (state is MainLoading) {
              LoaderWidget.showLoadingDialog();
            }
            if (state is MainSuccessful) {
              LoaderWidget.hideLoadingDialog();
            }
            if (state is MainFailure) {
              LoaderWidget.hideLoadingDialog();
              DialogService.showWarningDialog(state.error);
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
                appBar: AppBar(title: const Text('Худалдан авах'), centerTitle: true),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                ...List.generate(
                                  (provider.cart.products ?? []).length,
                                  ((index) {
                                    var item = (provider.cart.products ?? [])[index];
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(provider.getProductById(item.product ?? '')?.titleEllips ?? ''),
                                        Text((item.quantity ?? 0).toString()),
                                      ],
                                    );
                                  }),
                                ),
                                const SizedBox(height: 30),
                                ...List.generate(provider.addresses.length, ((index) {
                                  var item = provider.addresses[index];
                                  return InkWell(
                                    onTap: () => _setAddress(index),
                                    child: AddressTile(item, isActive: _addressIdx == index),
                                  );
                                })),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: _pointCtrl,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(labelText: 'Оноо зарцуулах'),
                                  validator: UtilRegex.validate,
                                ),
                                Text("Таны оноо: ${provider.user?.point}"),
                                const SizedBox(height: 20),
                                Button(onPress: _onPress, title: 'Нэмэх'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
