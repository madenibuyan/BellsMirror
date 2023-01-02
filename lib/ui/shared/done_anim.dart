import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bells_mirror/utils/constant_string.dart';


class DoneAnim extends StatefulWidget {

  final int size;

  DoneAnim({this.size});


  @override
  _DoneAnimState createState() => _DoneAnimState();
}

class _DoneAnimState extends State<DoneAnim> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double> (
      begin: 0.0,
      end: 1
    ).animate(_animationController);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds :500));
    _animationController.forward();
  }

  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ScaleTransition(scale: _animationController,
      child: Container(
        width: widget.size == null ? 60.w : widget.size.toDouble(),
        height: widget.size == null ? 60.w : widget.size.toDouble(),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Constant.checkedIcon),
                fit: BoxFit.contain
            )
        ),
      ),
    );
  }
}
