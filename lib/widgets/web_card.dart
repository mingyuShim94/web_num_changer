import 'package:flutter/material.dart';

class WebCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.yellow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.gpp_maybe),
          Text("www.naever.com"),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
