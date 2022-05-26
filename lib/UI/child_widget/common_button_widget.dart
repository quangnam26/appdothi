import 'package:app_nha_dat/util/color_manager/color_app_manager.dart';
import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonBtnWidget extends StatefulWidget {
  CommonBtnWidget({Key? key, required this.txtbtn, required this.onPressed})
      : super(key: key);
  String txtbtn;
  Function() onPressed;
  @override
  State<CommonBtnWidget> createState() => _CommonBtnWidgetState();
}

class _CommonBtnWidgetState extends State<CommonBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: FontsAppManager().textStyle(
              "SVN-Coder's-Crux", FontWeight.w400, FontStyle.normal, 21),
          primary: ColorAppManager.backgroundBtn),
      child: Text(widget.txtbtn),
      onPressed: widget.onPressed,
    );
  }
}
