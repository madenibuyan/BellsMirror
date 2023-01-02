import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant_string.dart';

class LoadingAnim extends StatefulWidget {
  @override
  _LoadingAnimState createState() => _LoadingAnimState();
}

class _LoadingAnimState extends State<LoadingAnim> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double> (
      begin: 0.0,
      end: 1
    ).animate(_animationController);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds :1000));
    _animationController.repeat();
  }

  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(

        turns: _animationController,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Constant.loaderIcon),
          fit: BoxFit.contain
          )
        ),
      )
    );
  }
}
