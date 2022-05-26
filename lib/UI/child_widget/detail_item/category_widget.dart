// import 'package:app_nha_dat/provider/items_model_provider.dart';
// import 'package:app_nha_dat/util/font_manager/fonts_app_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: Provider.of<ItemsModelChangeNotifier>(context)
//           .categoryMap
//           .keys
//           .map<Widget>((e) => Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(e,
//                         style: FontsAppManager().fontFamily("SVN-Coder's-Crux",
//                             FontWeight.w400, FontStyle.normal, 26,
//                             color: const Color(0xffBCEFE7))),
//                     ElevatedButton(
//                         style: ButtonStyle(
//                           textStyle:
//                               MaterialStateProperty.resolveWith<TextStyle>(
//                                   (Set<MaterialState> states) =>
//                                       FontsAppManager().fontFamily(
//                                           "SVN-Coder's-Crux",
//                                           FontWeight.w400,
//                                           FontStyle.normal,
//                                           21,
//                                           color: Colors.white)),
//                           shape:
//                               MaterialStateProperty.resolveWith<OutlinedBorder>(
//                                   (Set<MaterialState> states) =>
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(25))),
//                           backgroundColor:
//                               MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                               if (states.contains(MaterialState.pressed)) {
//                                 return const Color(0xffFEAE34);
//                               }
//                               return const Color(0xff309930);
//                             },
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           "Download",
//                         ))
//                   ],
//                 ),
//                 const Divider(
//                   color: Color(0xff293634),
//                   thickness: 1,
//                 )
//               ]))
//           .toList(),
//     );
//   }
// }
