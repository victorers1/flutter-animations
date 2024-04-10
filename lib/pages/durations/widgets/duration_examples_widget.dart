import 'package:flutter/material.dart';

class DurationsExamplesWidget extends StatefulWidget {
  const DurationsExamplesWidget({
    super.key,
    required this.durations,
    required this.durationsNames,
  });

  final List<Duration> durations;
  final List<String> durationsNames;

  @override
  State<DurationsExamplesWidget> createState() =>
      _DurationsExamplesWidgetState();
}

class _DurationsExamplesWidgetState extends State<DurationsExamplesWidget>
    with TickerProviderStateMixin {
  late final List<AnimationController> _animationController;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _animationController = List.generate(
      widget.durations.length,
      (index) =>
          AnimationController(vsync: this, duration: widget.durations[index]),
    );

    _animations = _animationController
        .map(
          (controller) => Tween<double>(begin: 0, end: 1).animate(controller),
        )
        .toList();
  }

  @override
  void dispose() {
    for (final controller in _animationController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardTitleStyle = Theme.of(context).textTheme.bodyLarge;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.durations.length,
      itemBuilder: (context, index) {
        final duration = widget.durations[index];
        final name = widget.durationsNames[index];
        final animation = _animations[index];

        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    style: cardTitleStyle,
                    children: [
                      TextSpan(
                        text: 'Durations.$name',
                        style: cardTitleStyle?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ': ${duration.inMilliseconds} ms')
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      icon: const Icon(Icons.play_arrow_rounded),
                      onPressed: () {
                        _animationController[index]
                          ..reset()
                          ..forward();
                      },
                    ),
                    Flexible(
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) =>
                            CircularProgressIndicator.adaptive(
                          value: animation.value,
                        ),
                      ),
                    ),
                    Flexible(
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) => LinearProgressIndicator(
                          value: animation.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
