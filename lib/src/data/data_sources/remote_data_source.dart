import 'dart:convert';

import 'package:catbreeds/src/adapters/http_client.dart';
import 'package:catbreeds/src/config/config.dart';

class RemoteDataSource {

  static final Map<String, String> _headers = {
                                              "Content-type": "application/json",
                                              "x-api-key": Config.apiKey
                                              };

  final HttpClientAdapter _client = HttpClientAdapter( headers: _headers, host: Config.host);

  Future<String> get(String search) async {
    String path = "breeds";
    if (search.isNotEmpty){
      path = "$path/search?q=$search";
    }
    final response = await _client.get(path: path, headers: _headers);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ArgumentError(response.body);
    }
    return response.body;
  }

  Future<String> getImageUrl(String breedId) async {
    try{
      String path = "images";
      if (breedId.isNotEmpty){
        path = "$path/search?breed_ids=$breedId";
      }
      final response = await _client.get(path: path, headers: _headers);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ArgumentError(response.body);
      }
      return jsonDecode(response.body)[0]["url"];
    }catch(e){
      return "";
    }
  }

}
