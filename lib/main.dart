import 'package:flutter/material.dart';
import 'package:web_number_changer/screens/home_screen.dart';
import 'package:web_number_changer/services/api_service.dart';

void main() async {
  // ApiService().getIsWebExist();
  final webUrl = 'https://bam345co.com';
  ApiService myUrl = ApiService(webUrl);
  var nextUrl = await myUrl.getIsWebExist();
  if (nextUrl == null) {
    var newUrl = webUrl.replaceAllMapped(
        RegExp(r'\d+'), (Match m) => (int.parse(m[0]!) + 1).toString());
    nextUrl = await ApiService(newUrl).getIsWebExist();
  }
  print('nextUrl: $nextUrl');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
