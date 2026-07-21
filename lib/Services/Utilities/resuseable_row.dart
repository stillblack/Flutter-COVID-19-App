import 'package:flutter/material.dart';

class ReuseAbleRow extends StatelessWidget {
  final String title;
  final String value;

  const ReuseAbleRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(),
      ],
    );
  }
}
