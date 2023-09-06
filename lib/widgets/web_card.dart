import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_number_changer/services/api_service.dart';

class WebCard extends StatefulWidget {
  final String webUrl;

  const WebCard({super.key, required this.webUrl});

  @override
  State<WebCard> createState() => _WebCardState();
}

class _WebCardState extends State<WebCard> {
  late String _webUrl;

  @override
  void initState() {
    super.initState();
    _webUrl = widget.webUrl;
  }

  void onRefreshWeb() async {
    print('Icon clicked');

    ApiService myUrl = ApiService(_webUrl);
    var nextUrl = await myUrl.getIsWebExist();
    if (nextUrl == null) {
      var newUrl = _webUrl.replaceAllMapped(
          RegExp(r'\d+'), (Match m) => (int.parse(m[0]!) + 1).toString());
      nextUrl = await ApiService(newUrl).getIsWebExist();
    }
    print('nextUrl: $nextUrl');
    await launchUrl(Uri.parse(nextUrl!));
    setState(() {
      print(nextUrl);
      _webUrl = nextUrl!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.yellow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.gpp_maybe),
          Text(_webUrl),
          GestureDetector(onTap: onRefreshWeb, child: Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
