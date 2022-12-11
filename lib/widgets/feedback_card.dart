import 'dart:html';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../app_theme.dart';
import 'package:tk_akhir/models/feedback_model.dart';

class FeedbackCard extends StatelessWidget {
  final String title;
  final String username;
  final String description;

  const FeedbackCard(
      {Key? key,
      required this.title,
      required this.username,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: 300,
        child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: const Color(0xFFD8C3A5),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFEAE7DC),
                    radius: 108,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("profile.png"), //NetworkImage
                      radius: 100,
                    ), //CircleAvatar
                  ),
                  const SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ), //SizedBox

                  Text(
                    description,
                    // 'GeeksforGeeks is a computer science portal for geeks at geeksforgeeks.org. It contains well written, well thought and well explained computer science and programming articles, quizzes, projects, interview experiences and much more!!',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ), //Textstyle
                  ), //Text
                  const SizedBox(
                    height: 10,
                  ),

                  // SizedBox(
                  //   width: 100,
                  //   child: ElevatedButton(
                  //     onPressed: () => 'Null',
                  //     style: ButtonStyle(
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.lightGreen)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(4),
                  //       child: Row(
                  //         children: const [
                  //           Icon(Icons.touch_app),
                  //           Text('delete')
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ] //CircleAvatar
                    ))));
  }

  // return SizedBox(
  //   height: 170,
  //   width: 300,
  //   child: Card(
  //     elevation: 8,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  //     color: AppTheme.beige,
  //     child: Padding(
  //       padding: const EdgeInsets.all(34.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(
  //                 color: Color.fromARGB(255, 54, 52, 52),
  //                 fontWeight: FontWeight.w900,
  //                 fontFamily: 'Avenir',
  //                 fontSize: 20),
  //             textAlign: TextAlign.left,
  //           ),
  //           Text(
  //             username,
  //             style: const TextStyle(
  //                 color: Color.fromARGB(255, 54, 52, 52),
  //                 fontWeight: FontWeight.w900,
  //                 fontFamily: 'Avenir',
  //                 fontSize: 18),
  //             textAlign: TextAlign.left,
  //           ),
  //           const SizedBox(
  //             height: 24,
  //           ),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: const [
  //               Text(
  //                 "Know More",
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w600,
  //                     fontFamily: 'Avenir',
  //                     fontSize: 12),
  //                 textAlign: TextAlign.left,
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 5.0),
  //                 child: Icon(
  //                   Ionicons.arrow_forward,
  //                   color: AppTheme.darkBeige,
  //                   size: 20,
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // );
//   }
// }

}
