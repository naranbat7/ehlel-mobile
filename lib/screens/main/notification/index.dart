import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мэдэгдэл'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Хоосон байна'),
      ),
    );
  }
}
