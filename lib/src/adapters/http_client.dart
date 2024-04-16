import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClientAdapter {

  final Map<String, String> _headers;
  final String _host;

  HttpClientAdapter({required String host, required Map<String, String> headers}):
        _headers = headers,
        _host = host;

  Future<http.Response> get({required String path, Map<String, String>? headers}) async {
    String url = "$_host/$path";
    return http.get(Uri.parse(url), headers: headers ?? _headers);
  }

  Future<http.Response> post({required String path, Map<String, String>? headers,required Map<String, dynamic> body}) async {
    String url = "$_host/$path";
    return http.post(Uri.parse(url), headers: headers ?? _headers, body: json.encode(body));
  }
}
