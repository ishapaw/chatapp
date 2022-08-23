// import 'package:chatapp/reusable_widgets.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
//
// class ShareScreen extends StatefulWidget {
//   const ShareScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ShareScreen> createState() => _ShareScreenState();
// }
//
// class _ShareScreenState extends State<ShareScreen> {
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(24),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: controller,
//                 cursorColor: Colors.black,
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(0.9),
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Enter",
//                   hintStyle: TextStyle(
//                     color: Color(0xff6A5C5C),
//                   ),
//                   filled: true,
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   fillColor: Color(0xffE1E0EB),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(width: 0, style: BorderStyle.none),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 32,
//               ),
//               Container(
//                 width: 150,
//                 height: 50,
//                 margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (controller.text.isNotEmpty) {
//                       final filePaths = await pickFile();
//
//                       Share.shareFiles((filePaths as List<String>),
//                           text: controller.text);
//                     }
//                   },
//                   child: Center(
//                     child: Text(
//                       "Share",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   style: ButtonStyle(
//                       shadowColor:
//                           MaterialStateProperty.all<Color>(Colors.black),
//                       backgroundColor:
//                           MaterialStateProperty.resolveWith((states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           return Colors.black;
//                         }
//                         return Color(0xff131040);
//                       }),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)))),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<List<String?>> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true);
//     return  result == null ? <String>[] : result.paths;
//   }
// }
