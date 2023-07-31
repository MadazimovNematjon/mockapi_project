import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "64c78f3f0a25021fde92ae00.mockapi.io";

  static String API_GET_LIST = "/api/v1/user";
  static String API_CREATE = "/api/v1/user";
  static String API_UPDATE = "/api/v1/user/";
  static String API_DELETE = "/api/v1/user/";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Future GET(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api, params);
      var response = await get(uri);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static Future POST(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response =
          await post(uri, headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static Future PUT(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response = await put(uri, headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static Future DELETE(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api, params);
      var response = await delete(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static Map<String, String> paramEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title!,
      'body': post.body!,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title!,
      'body': post.body!,
    });
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
