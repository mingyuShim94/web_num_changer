import 'package:flutter/material.dart';
import 'package:web_number_changer/widgets/web_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1C1038),
          leading: const Icon(Icons.settings),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            WebCard(),
            WebCard(),
            WebCard(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
// Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(color: Colors.yellow),
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(Icons.webhook),
//                         Text(
//                           'www.naver.com',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         Icon(Icons.more_vert)
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),