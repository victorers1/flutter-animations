import 'package:animations/mixins/page_title_from_route_name_mixin.dart';
import 'package:animations/pages/durations/widgets/duration_examples_widget.dart';
import 'package:animations/pages/durations/widgets/duration_section.dart';
import 'package:flutter/material.dart';

/// Material Design 3 Durations
class MD3DurationsPage extends StatefulWidget {
  static const String routeName = '/durations';
  const MD3DurationsPage({super.key});

  @override
  State<MD3DurationsPage> createState() => _MD3DurationsPageState();
}

class _MD3DurationsPageState extends State<MD3DurationsPage>
    with PageTitleMixin, TickerProviderStateMixin {
  final shortDurations = {
    'short1': Durations.short1,
    'short2': Durations.short2,
    'short3': Durations.short3,
    'short4': Durations.short4,
  };

  final mediumDurations = {
    'medium1': Durations.medium1,
    'medium2': Durations.medium2,
    'medium3': Durations.medium3,
    'medium4': Durations.medium4,
  };

  final longDurations = {
    'long1': Durations.long1,
    'long2': Durations.long2,
    'long3': Durations.long3,
    'long4': Durations.long4,
  };

  final extraLongDurations = {
    'extralong1': Durations.extralong1,
    'extralong2': Durations.extralong2,
    'extralong3': Durations.extralong3,
    'extralong4': Durations.extralong4,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getPageTitle(MD3DurationsPage.routeName))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DurationSectionWidget(
              title: 'Short durations',
              description:
                  'These are used for small utility-focused transitions.',
              examples: DurationsExamplesWidget(
                durations: shortDurations.values.toList(),
                durationsNames: shortDurations.keys.toList(),
              ),
            ),
            const SizedBox(height: 32),
            DurationSectionWidget(
              title: 'Medium durations',
              description:
                  'These are used for transitions that traverse a medium area of the screen.',
              examples: DurationsExamplesWidget(
                durations: mediumDurations.values.toList(),
                durationsNames: mediumDurations.keys.toList(),
              ),
            ),
            const SizedBox(height: 32),
            DurationSectionWidget(
              title: 'Long  durations',
              description:
                  'These durations are often paired with Emphasized easing. They\'re used for large expressive transitions',
              examples: DurationsExamplesWidget(
                durations: longDurations.values.toList(),
                durationsNames: longDurations.keys.toList(),
              ),
            ),
            const SizedBox(height: 32),
            DurationSectionWidget(
              title: 'Extra long durations',
              description:
                  'Though rare, some transitions use durations above 600ms. These are usually used for ambient transitions that don\'t involve user input.',
              examples: DurationsExamplesWidget(
                durations: extraLongDurations.values.toList(),
                durationsNames: extraLongDurations.keys.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
