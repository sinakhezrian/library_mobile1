import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_mobile/api/apiConfig.dart';

class ApiController {
  static Future<dynamic> send(
    String route,
    RequestType type,
    Object body,
    Map<String, String> headers,
  ) async {
    print("---- 1> run api request");
    print(
        "route:$route - requestType:$type");
    var url = (apiProtocol == RequestProtocolType.http)
        ? Uri.http(apiDomain, route)
        : Uri.https(apiDomain, route);
    var response;
    var defaultHeaders = {'accept': 'application/json'};
    try {
      if (type == RequestType.post) {
        response = await http.post(
          url,
          body: body,
          headers: {...headers, ...defaultHeaders},
        );
      } else if (type == RequestType.put) {
        response = await http.put(
          url,
          body: body,
          headers: {...headers, ...defaultHeaders},
        );
      } else if (type == RequestType.delete) {
        response = await http.delete(
          url,
          body: body,
          headers: {...headers, ...defaultHeaders},
        );
      } else {
        response =
            await http.get(url, headers: {...headers, ...defaultHeaders});
      }
      print("---- 2> api request success response : " + response.body);
      return await response;
    } catch (e) {
      print("---- 2> api request error response : " + e.toString());
      return {
        "message": e.toString(), "success": false,
        "statusCode": 501
      };
    }
  }
}

enum RequestType { get, post, put, delete }

enum RequestProtocolType { http, https }
