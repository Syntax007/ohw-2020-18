import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  const MainButton({
    Key key,
    this.color,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 100.sp,
        width: 400.sp,
        padding: EdgeInsets.symmetric(
          vertical: 15.sp,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.sp),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 40.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
