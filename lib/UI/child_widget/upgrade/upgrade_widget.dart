import 'package:app_nha_dat/UI/child_widget/upgrade/premium_plan_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

class UpgradeWidget extends StatefulWidget {
  const UpgradeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UpgradeWidget> createState() => _UpgradeWidgetState();
}

class _UpgradeWidgetState extends State<UpgradeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 15, right: 15),
            // padding: EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    scale: 0.9,
                    fit: BoxFit.fill,
                    image: AssetImage(
                        "assets/images/bg_show_dialog_premium.png"))),
            child: AlertDialog(
                // insetPadding: EdgeInsets.only(left: 15, right: 15),
                contentPadding: const EdgeInsets.only(left: 30, right: 30),
                // scrollable: true,
                // shape: RoundedRectangleBorder(
                //     side: const BorderSide(color: Color(0xffFFA113), width: 5),
                //     borderRadius: BorderRadius.circular(16)),
                // backgroundColor: const Color.fromRGBO(14, 14, 15, .8),
                backgroundColor: Colors.transparent,
                contentTextStyle: TextStyle(
                    fontFamily: 'Minecraft',
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(150, 20),
                        <Color>[
                          const Color(0xffFFA113),
                          const Color(0xffFFBD13),
                        ],
                      ),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 30),
                content: FittedBox(
                    child: Text(
                  "unlock this item".toUpperCase(),
                  textAlign: TextAlign.center,
                )),
                title: Container(
                    // alignment: Alignment.topCenter,
                    child: Image.asset(
                  "assets/images/imageAd.png",
                  // height: 203,
                  // fit: BoxFit.contain,
                  // alignment: Alignment.topCenter,
                )),
                actions: [
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 5.0, color: Color(0xff1E2027)),
                              left: BorderSide(
                                  width: 5.0, color: Color(0xff585A66)),
                              right: BorderSide(
                                  width: 5.0, color: Color(0xffA6A7AC)),
                              top: BorderSide(
                                  width: 5.0, color: Color(0xff7C7D83)))),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              textStyle: GoogleFonts.tomorrow(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 30, 0),
                              primary: const Color(0xff4A4C54)),
                          onPressed: () {},
                          icon: const Icon(Icons.video_settings),
                          label: const Text("Watch video and download"))),
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 5.0, color: Color(0xffBE4603)),
                              left: BorderSide(
                                  width: 5.0, color: Color(0xffEC6A21)),
                              right: BorderSide(
                                  width: 5.0, color: Color(0xffFFF6A3)),
                              top: BorderSide(
                                  width: 5.0, color: Color(0xffFFCA43)))),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              textStyle: GoogleFonts.tomorrow(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 30, 0),
                              primary: const Color(0xffFFA113)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const PremiumPlanWidget())));
                          },
                          icon: Image.asset("assets/images/icon_prenium.png"),
                          label: Text("Premium Upgrade".toUpperCase())))
                ],
                actionsPadding: const EdgeInsets.only(
                    left: 0, right: 0, top: 0, bottom: 45))),
        TextButton(
          // child: const Icon(
          //   ,
          //   color: Colors.white,
          //   size: 29,
          // ),
          child: Image.asset("assets/images/close.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
