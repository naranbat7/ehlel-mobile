import 'package:ehlel/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        final user = provider.user;
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(height: 80, child: Icon(Icons.supervised_user_circle, size: 90)),
                  const SizedBox(height: 12.0),
                  Text(
                    user?.firstname ?? '-',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.orange),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40.0),
                      _buildTile('Email', user?.email ?? '-', Icons.email),
                      const SizedBox(height: 12.0),
                      _buildTile('Mobile', user?.phone ?? '-', Icons.phone),
                      const SizedBox(height: 12.0),
                      _buildTile('Birth date', '-', Icons.date_range),
                      const SizedBox(height: 12.0),
                      _buildTile('Gender', '-', Icons.person),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTile(String title, String value, IconData icon) {
    return Row(children: [
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
        child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(10.0))),
          child: Icon(
            icon,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0, color: Colors.grey),
          ),
          const SizedBox(height: 1),
          Text(value)
        ],
      )
    ]);
  }
}
