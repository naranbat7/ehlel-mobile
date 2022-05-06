import 'package:ehlel/providers/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:ehlel/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Хаягийн жагсаалт'), centerTitle: true),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, addAddressRoute),
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: provider.addresses.isNotEmpty
                ? Scrollbar(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: provider.addresses.length,
                        itemBuilder: ((context, index) => AddressTile(provider.addresses[index])),
                      ),
                    ),
                  )
                : const Center(child: Text('Хоосон байна')),
          ),
        );
      },
    );
  }
}
