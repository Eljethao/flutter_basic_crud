import 'dart:convert';

import 'package:flutter_basic_crud/services/api.dart';
import 'package:http/http.dart' as http;

class UserService {
  getAllUser() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('$APP_URL/v0/api/get/users'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        return decodedMap;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
