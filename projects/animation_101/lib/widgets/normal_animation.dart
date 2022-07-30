import 'package:flutter/material.dart';

class NormalAnimation extends StatefulWidget {
  const NormalAnimation({Key? key}) : super(key: key);

  @override
  State<NormalAnimation> createState() => _NormalAnimationState();
}

class _NormalAnimationState extends State<NormalAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> opacityAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

// init controller
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
// init animation
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // ..addStatusListener((status) {
    //   print('$status');
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        //第四步
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  // Leave out the height and width so it fills the animating parent
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}
// #enddocregion LogoWidget

// #docregion GrowTransition
class GrowTransition extends StatelessWidget {
  const GrowTransition({required this.child, required this.animation, Key? key})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: SizedBox(
              height: _sizeTween.evaluate(animation),
              width: _sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
