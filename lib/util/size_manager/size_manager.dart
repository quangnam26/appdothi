import 'package:flutter/cupertino.dart';

class SizeManager {
  static double ratioHvsWImageUrl = 480 / 700;
  static double ratioHvsWThumbUrl = 2 / 3;
  // static double? boxWidth;
  // static double? boxHeight;
  static double? totalSpaceHorizontal = 0;

  static setTotalSpaceHorizontal(double width, BuildContext context) {
    return totalSpaceHorizontal = width * 0.07;
  }

  static setHeightImageUrlItem(
      double width, BuildContext context, double space) {
    return (width - space) * ratioHvsWImageUrl;
  }

  static setHeightThumbUrlItem(
      double width, BuildContext context, double space) {
    // print((width - space) * ratioHvsWThumbUrl);
    return (width - space) * ratioHvsWThumbUrl;
  }

  static setChildAspectRatio(double childAspectRatio) => childAspectRatio;
}
