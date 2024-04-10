import 'dart:math';

import 'package:animations/extensions/int_entensions.dart';
import 'package:animations/mixins/page_title_from_route_name_mixin.dart';
import 'package:animations/widgets/circle_container_widget.dart';
import 'package:animations/widgets/axis_widget.dart';
import 'package:flutter/material.dart';

class ChainedAnimationsPage extends StatefulWidget with PageTitleMixin {
  const ChainedAnimationsPage({super.key});

  static const String routeName = '/chained-animations';

  @override
  State<ChainedAnimationsPage> createState() => _ChainedAnimationsPageState();
}

class _ChainedAnimationsPageState extends State<ChainedAnimationsPage>
    with PageTitleMixin, TickerProviderStateMixin {
  late Animation<double> _counterClockWiseRotationAnimation;
  late final AnimationController _counterClockWiseRotationController;

  late Animation<double> _flipAnimation;
  late final AnimationController _flipController;

  late AnimationController _lastRunningController;

  bool isPaused = false;

  @override
  void dispose() {
    _counterClockWiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _lastRunningController = _counterClockWiseRotationController =
        AnimationController(vsync: this, duration: 1.sec);
    // first iteration of counter clockwise animation
    _counterClockWiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(
      CurvedAnimation(
        parent: _counterClockWiseRotationController,
        curve: Curves.bounceOut,
      ),
    );

    _flipController = AnimationController(
      vsync: this,
      duration: 1.sec,
    );
    // first iteration of flip animation
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(_flipController);

    _counterClockWiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // following iterations of flip animation
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(
          CurvedAnimation(parent: _flipController, curve: Curves.bounceOut),
        );
        _flipController
          ..reset()
          ..forward();

        _lastRunningController = _flipController;
      }
    });

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // following iterations of counter clockwise animation
        _counterClockWiseRotationAnimation = Tween<double>(
          begin: _counterClockWiseRotationAnimation.value,
          end: _counterClockWiseRotationAnimation.value - (pi / 2.0),
        ).animate(
          CurvedAnimation(
            parent: _counterClockWiseRotationController,
            curve: Curves.bounceOut,
          ),
        );

        _counterClockWiseRotationController
          ..reset()
          ..forward();

        _lastRunningController = _counterClockWiseRotationController;
      }
    });

    Future.delayed(
      2.sec,
      toggleAnimationExecution,
    );
  }

  void toggleAnimationExecution() {
    setState(() {
      if (_lastRunningController.isAnimating) {
        _lastRunningController.stop();
      } else {
        _lastRunningController.forward();
      }

      isPaused = !_lastRunningController.isAnimating;
    });
  }

  bool get _isAnimationRunning =>
      _counterClockWiseRotationController.isAnimating ||
      _flipController.isAnimating;

  @override
  Widget build(BuildContext context) {
    const containerSize = 200.0;

    return PopScope(
      canPop: _isAnimationRunning || isPaused,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            getPageTitle(
              ChainedAnimationsPage.routeName,
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _counterClockWiseRotationAnimation,
            builder: (context, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                _counterClockWiseRotationAnimation.value,
              ),
              child: child,
            ),
            child: AnimatedBuilder(
              animation: _flipAnimation,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(_flipAnimation.value),
                child: child,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  height: containerSize,
                  width: containerSize,
                  child: AxisWidget(
                    child: CircleContainerWidget(size: containerSize),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: toggleAnimationExecution,
          child: Icon(
            _isAnimationRunning
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
          ),
        ),
      ),
    );
  }
}
