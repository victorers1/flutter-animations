import 'dart:math';

import 'package:animations/extensions/int_entensions.dart';
import 'package:animations/mixins/page_title_from_route_name_mixin.dart';
import 'package:animations/widgets/axis_widget.dart';
import 'package:flutter/material.dart';

class RotationsPage extends StatefulWidget {
  const RotationsPage({super.key});

  static const String routeName = '/rotations';

  @override
  State<RotationsPage> createState() => _RotationsPageState();
}

class _RotationsPageState extends State<RotationsPage>
    with SingleTickerProviderStateMixin, PageTitleMixin {
  late final Animation _animation;
  late final AnimationController _animationController;
  bool isPaused = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: 3.sec,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController);

    Future.delayed(2.sec, toggleAnimationExecution);
  }

  void toggleAnimationExecution() {
    setState(() {
      _animationController.isAnimating
          ? _animationController.stop()
          : _animationController.repeat();

      isPaused = !_animationController.isAnimating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget container = SizedBox.square(
      dimension: 100,
      child: AxisWidget(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );

    return PopScope(
      canPop: _animationController.isAnimating || isPaused,
      child: Scaffold(
        appBar: AppBar(title: Text(getPageTitle(RotationsPage.routeName))),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Rotation on X axis:'),
                const SizedBox(height: 16),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Transform(
                    // alignment: Alignment.center,
                    transform: Matrix4.rotationX(_animation.value),
                    child: child,
                  ),
                  child: container,
                ),
                const SizedBox(height: 48),
                const Text('Rotation on Y axis:'),
                const SizedBox(height: 16),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Transform(
                    // alignment: Alignment.center,
                    transform: Matrix4.rotationY(_animation.value),
                    child: child,
                  ),
                  child: container,
                ),
                const SizedBox(height: 48),
                const Text('Rotation on Z axis:'),
                const SizedBox(height: 16),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Transform(
                    // alignment: Alignment.center,
                    transform: Matrix4.rotationZ(_animation.value),
                    child: child,
                  ),
                  child: container,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: toggleAnimationExecution,
          child: Icon(
            _animationController.isAnimating
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
