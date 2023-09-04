import 'package:flutter/material.dart';
import 'package:web_number_changer/widgets/web_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "";
  List<WebAddress> webAddress = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1C1038),
          leading: const Icon(Icons.settings),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: webAddress.length,
          itemBuilder: (context, index) {
            return WebCard(webUrl: webAddress[index].webUrl);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('사이트주소를 입력해주세요'),
                    actions: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            url = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            webAddress.add(WebAddress(url));
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('확인'),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class WebAddress {
  final String webUrl;

  WebAddress(this.webUrl);
}
