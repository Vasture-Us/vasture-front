import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// NOTE 押すと沈むアニメーションの実装
class BouncedAnimation extends StatefulHookWidget {
  const BouncedAnimation({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<BouncedAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<BouncedAnimation>
    with SingleTickerProviderStateMixin {
  static const animationDuration = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: animationDuration),
      upperBound: 0.03,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: animationDuration),
      () {
        // NOTE this is crucial point to prevent error
        if (mounted) {
          animationController.reverse();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      // NOTE GestureDetectorのタップ範囲を広げる
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }
}