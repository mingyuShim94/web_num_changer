import 'package:flutter/material.dart';

class WebCard extends StatelessWidget {
  final String webUrl;

  const WebCard({super.key, required this.webUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.yellow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.gpp_maybe),
          Text(webUrl),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
