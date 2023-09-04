import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  //url constructor
  ApiService(this.baseUrl);

  Future<String?> getIsWebExist() async {
    final url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url);
      print("status:${response.statusCode}");

      if (response.statusCode == 200) {
        // print('웹사이트가 존재합니다.');
        // var host = url.host;
        // 도메인에서 숫자 부분을 찾는 정규 표현식을 생성합니다.
        RegExp regExp = RegExp(r'(\d+)');

        // 도메인에서 숫자 부분을 동적으로 바꿉니다.
        String pattern = baseUrl.replaceAllMapped(regExp, (match) => r'(\d+)');

        // 완전한 정규 표현식을 생성합니다.
        RegExp completeRegExp = RegExp(pattern);

        // print(pattern);
        // HTML에서 첫 번째로 원하는 패턴을 찾습니다.
        Match? firstMatch = completeRegExp.firstMatch(response.body);

        if (firstMatch != null) {
          print("First match found: ${firstMatch.group(0)}");
          return firstMatch.group(0);
        } else {
          print('원하는 문자열을 찾을 수 없습니다.');
          return null;
        }
      } else {
        print('웹사이트가 존재하지 않습니다.');
        return null;
      }
    } catch (e) {
      if (e is http.ClientException) {
        print('ClientException caught: ${e.message}');
        return null;
      } else {
        print('Unknown exception caught: $e');
        return null;
      }
    }
  }
}
