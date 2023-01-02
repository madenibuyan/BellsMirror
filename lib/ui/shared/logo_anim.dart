
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bells_mirror/utils/constant_string.dart';

class LogoAnim extends StatefulWidget {
  @override
  _LogoAnimState createState() => _LogoAnimState();
}

class _LogoAnimState extends State<LogoAnim> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double> (
        begin: 0.2,
        end: 1
    ).animate(_animationController);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds :1000));
    _animationController.addListener(() {
      if(_animationController.isCompleted){
        _animationController.reverse();
      } else if(_animationController.isDismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animationController,
        child: Container(
          width: 140.w,
          height: 96.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Constant.logoImage),
                  fit: BoxFit.contain
              )
          ),
        )
    );
  }
}
