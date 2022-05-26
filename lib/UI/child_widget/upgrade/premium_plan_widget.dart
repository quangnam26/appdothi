import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
import 'package:flutter/material.dart';

class PremiumPlanWidget extends StatefulWidget {
  const PremiumPlanWidget({Key? key}) : super(key: key);

  @override
  State<PremiumPlanWidget> createState() => _PremiumPlanWidgetState();
}

// check() {
//   return "PREMIUM PLAN"
//       .runes
//       .map((rune) => new String.fromCharCode(rune))
//       .map((e) => e)
//       .toList()
//       .firstWhere((element) => element == "M", orElse: () {
//     return "";
//   });

//   // return word.split("").firstWhere((element) => element == word).isNotEmpty;
// }

class _PremiumPlanWidgetState extends State<PremiumPlanWidget> {
  @override
  Widget build(BuildContext context) {
    print(List<String>.generate(
            "PREMIUM PLAN".length, (index) => "PREMIUM PLAN"[index])
        .where((str) => str == "M")
        .map((s) => s)
        .toList());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xff258625)),
          child: Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: FontsAppManager().textStyle(
                "Bai_Jamjuree",
                FontWeight.w400,
                FontStyle.normal,
                12,
                color: Colors.white,
              )),
        ),
        Image.asset(
          "assets/images/bg_premium_plan.png",
          fit: BoxFit.cover,
          width: double.infinity,
          // height: double.infinity,
        ),
        Center(
          child: Container(
              alignment: Alignment.bottomCenter,
              // height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  // color: Color(0xff258625)
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: " ",
                          children: List<String>.generate("PREMIUM PLAN".length,
                              (index) => "PREMIUM PLAN"[index]).map((str) {
                            showColor(str, "M");
                            return TextSpan(
                                text: str,
                                style: FontsAppManager().textStyle(
                                  "SVN-Determination",
                                  FontWeight.w400,
                                  FontStyle.normal,
                                  46,
                                  color: checkLetter(str, "M")
                                      ? const Color(0xfff8a642)
                                      : Colors.white,
                                  shadows: const [
                                    Shadow(
                                        // bottomLeft
                                        offset: Offset(-1.5, -1.5),
                                        color: Color(0xff2F2A00)),
                                    Shadow(
                                        // bottomRight
                                        offset: Offset(1.5, -1.5),
                                        color: Color(0xff2F2A00)),
                                    Shadow(
                                        // topRight
                                        offset: Offset(1.5, 1.5),
                                        color: Color(0xff2F2A00)),
                                    Shadow(
                                        // topLeft
                                        offset: Offset(-1.5, 1.5),
                                        color: Color(0xff2F2A00)),
                                  ],
                                ));
                          }).toList())),
                  Text(
                    "FULL ACCESS \n UNLOCK ALL CONTENT \n  REMOVE ALL ADS",
                    textAlign: TextAlign.center,
                    style: FontsAppManager().textStyle("SVN-Determination",
                        FontWeight.w400, FontStyle.normal, 22,
                        color: Colors.white),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                              colors: [Color(0xffFFF56C), Color(0xffFFD233)])),
                      child: Column(
                        children: [
                          RichText(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: "Start 3 days Free Trial period. \n ",
                                    style: TextStyle(color: Colors.red)),
                                TextSpan(
                                    text: "Plan auto-renews to \$3.99/week \n",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: "Cancel anytime. \n",
                                    style: TextStyle(color: Colors.red))
                              ])),
                          Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/button_bg3.png"))),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      textStyle: FontsAppManager().textStyle(
                                        "SVN-Coder's-Crux",
                                        FontWeight.w400,
                                        FontStyle.normal,
                                        24,
                                      )),
                                  onPressed: () {},
                                  child:
                                      const Text("Start Plan And Free Trial"))),
                          Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/button_bg2.png"))),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      textStyle: FontsAppManager().textStyle(
                                        "SVN-Coder's-Crux",
                                        FontWeight.w400,
                                        FontStyle.normal,
                                        24,
                                      )),
                                  onPressed: () {},
                                  child: const Text(
                                      "3 Month Subscription / \$39.99"))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Privacy",
                                  style: FontsAppManager().textStyle(
                                      "SVN-Coder's-Crux",
                                      FontWeight.w400,
                                      FontStyle.normal,
                                      22,
                                      color: Colors.black)),
                              Text("Term of use",
                                  style: FontsAppManager().textStyle(
                                      "SVN-Coder's-Crux",
                                      FontWeight.w400,
                                      FontStyle.normal,
                                      22,
                                      color: Colors.black))
                            ],
                          )
                        ],
                      )),
                ],
              )),
        )
      ]),
    );
  }

  bool checkLetter(String word, String letterFillColor) {
    return word == letterFillColor;
  }

  showColor(String word, String l) {
    var c = checkLetter(word, l);
    // Color colors = Colors.transparent;
    if (c) {
      var item =
          // "PREMIUM PLAN"
          //     .runes
          //     .map((rune) => String.fromCharCode(rune))
          List<String>.generate(
                  "PREMIUM PLAN".length, (index) => "PREMIUM PLAN"[index])
              .where((str) => str == l)
              .map((s) => s)
              .toList();

      print(item);
    }

    // return colors;
  }
}
