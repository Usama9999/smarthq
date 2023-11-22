import 'package:flutter/material.dart';

TextStyle headingText({double size = 16, Color? color}) {
  return TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.w900,
      fontSize: (size));
}

TextStyle subHeadingText({double size = 16, Color? color}) {
  return TextStyle(
      color: color ?? Colors.black,
      fontSize: (size),
      fontFamily: 'poppins',
      fontWeight: FontWeight.w600);
}

TextStyle regularText({double size = 16, Color? color}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: (size),
    fontWeight: FontWeight.w500,
    fontFamily: 'poppins',
  );
}

TextStyle normalText({double size = 16, Color? color}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: (size),
    fontFamily: 'poppins',
    fontWeight: FontWeight.normal,
  );
}
