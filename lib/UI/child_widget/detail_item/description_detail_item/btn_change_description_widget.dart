import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BtnChangeDescriptionWidget extends StatefulWidget {
  BtnChangeDescriptionWidget({Key? key, required this.returnValue})
      : super(key: key);

  Function(bool) returnValue;

  @override
  State<BtnChangeDescriptionWidget> createState() =>
      _BtnChangeDescriptionWidgetState();
}

class _BtnChangeDescriptionWidgetState
    extends State<BtnChangeDescriptionWidget> {
  bool isViewmore = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
      onPressed: () {
        isViewmore = !isViewmore;
        widget.returnValue(isViewmore);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(isViewmore ? 'View less' : 'View more',
            textAlign: TextAlign.center,
            style: FontsAppManager().textStyle(
                "SVN-Determination", FontWeight.w400, FontStyle.normal, 14,
                color: const Color(0xff0FE900))),
        Icon(
            isViewmore
                ? Icons.keyboard_double_arrow_left
                : Icons.keyboard_double_arrow_right,
            color: const Color(0xff0FE900))
      ]),
    );
  }
}
