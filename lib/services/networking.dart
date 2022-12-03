import 'package:http/http.dart ' as http;

class Networking {
  Networking({this.uri});

  final dynamic uri;

  Future getData() async {
    final response = await http.get(uri);

    String data = response.body;

    if (response.statusCode == 200) {
      return data;
    } else {
      return print(response.statusCode);
    }
  }
}
