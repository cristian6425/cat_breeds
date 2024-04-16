import 'package:catbreeds/src/adapters/http_client.dart';
import 'package:catbreeds/src/config/config.dart';

class RemoteDataSource {

  static final Map<String, String> _headers = {
                                              "Content-type": "application/json",
                                              "x-api-key:": Config.apiKey
                                              };

  final HttpClientAdapter _client = HttpClientAdapter( headers: _headers, host: Config.host);

  Future<String> get() async {
    await _client.get(path: "/cats", headers: _headers);
    return Config.host;
  }

}
