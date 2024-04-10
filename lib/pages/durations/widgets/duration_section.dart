import 'package:flutter/material.dart';

class DurationSectionWidget extends StatelessWidget {
  const DurationSectionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.examples,
  });

  final String title;
  final String description;

  // Widgets below description
  final Widget examples;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        examples,
      ],
    );
  }
}
