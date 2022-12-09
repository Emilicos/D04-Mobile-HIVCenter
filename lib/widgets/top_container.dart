import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final dynamic padding;
  const TopContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [AppTheme.lightPink, AppTheme.beige],
          ),
          // color: AppTheme.lightPink,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
