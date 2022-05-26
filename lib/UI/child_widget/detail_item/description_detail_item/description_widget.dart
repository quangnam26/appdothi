import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: FontsAppManager().textStyle(
          "SVN-Coder's-Crux", FontWeight.w400, FontStyle.normal, 20,
          color: ColorAppManager.descriptionColor),
    );
  }
}
