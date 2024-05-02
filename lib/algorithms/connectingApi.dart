// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ConnectionToApi {
  ///connecting to API
  Future<String> connecttingApi(String urlGitApi) async {
    try {
      var response = await http.get(Uri.parse(urlGitApi));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        if (kDebugMode) {
          print('Error: ${response.reasonPhrase}');
        }
        return '';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: not Internet on your device!');
      }
      return '';
    }
  }
}
