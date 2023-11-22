import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}

class MaintainHeight extends StatefulWidget {
  final bool isScrollable;
  final Widget child;

  const MaintainHeight({
    Key? key,
    required this.isScrollable,
    required this.child,
  }) : super(key: key);

  @override
  State<MaintainHeight> createState() => _MaintainHeightState();
}

class _MaintainHeightState extends State<MaintainHeight> {
  @override
  Widget build(BuildContext context) {
    if (widget.isScrollable) {
      return widget.child;
    } else {
      return Expanded(child: widget.child);
    }
  }
}

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static late Orientation orientation;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double ht(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  if (SizeConfig.orientation == Orientation.portrait) {
    // screenHeight = screenHeight < 500 ? 550 : screenHeight;
    return (inputHeight / 812.0) * screenHeight;
  } else {
    return (inputHeight / 812.0) * SizeConfig.screenWidth;
  }
}

// Get the proportionate height as per screen size
double wd(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  if (SizeConfig.orientation == Orientation.portrait) {
    return (inputWidth / 375.0) * screenWidth;
  } else {
    return (inputWidth / 375.0) * SizeConfig.screenHeight;
  }
}

double tx(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  if (SizeConfig.orientation == Orientation.portrait) {
    screenWidth = screenWidth > 400 ? 400 : screenWidth;
    return (inputWidth / 375.0) * screenWidth;
  } else {
    double h = SizeConfig.screenHeight > 400 ? 400 : SizeConfig.screenHeight;
    return (inputWidth / 375.0) * h;
  }
}
