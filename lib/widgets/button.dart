import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPress;
  final String title;

  const Button({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
