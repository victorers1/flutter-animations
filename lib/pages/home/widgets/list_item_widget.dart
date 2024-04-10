import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );
  }
}
