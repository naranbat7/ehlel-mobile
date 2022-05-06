import 'package:ehlel/providers/index.dart';
import 'package:ehlel/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        final user = provider.user;
        return Drawer(
          elevation: 20.0,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                arrowColor: Colors.white54,
                accountName: Text(user?.firstname ?? ''),
                accountEmail: Text(user?.email ?? ''),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white54,
                ),
              ),
              ListTile(
                title: const Text("Нүүр"),
                leading: IconButton(
                  icon: const Icon(Icons.location_on_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              const Divider(color: Colors.white),
              ListTile(
                title: const Text("Хаяг"),
                leading: IconButton(
                  icon: const Icon(Icons.local_library_rounded),
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, addressRoute);
                },
              ),
              const Divider(color: Colors.white),
              ListTile(
                title: const Text("Бүтээгдэхүүн"),
                leading: IconButton(
                  icon: const Icon(Icons.local_library_rounded),
                  onPressed: () {},
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: const Text("Гарах"),
                leading: IconButton(
                  icon: const Icon(Icons.exit_to_app_outlined),
                  onPressed: () {},
                ),
                onTap: () {
                  provider.resetUser();
                  Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                },
              ),
              const Divider(color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}
