import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/news.dart';

///
/// @See: Dio Http request flutter API request | News app
///
class DioClient {
  final Dio dio = Dio();

  static const String _apiKey = "435187bc85b74ac693ddf4220e6795b5";
  static const String _url =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-04-08&sortBy=publishedAt&apiKey=$_apiKey";
  // static const baseURL = "https://jsonplaceholder.typicode.com";
  // static const postsEndpoint = baseURL + "/posts";
  Future<List<Article>> fetchNewsArticle() async {
    try {
      Response res = await dio.get(_url);
      News response = News.fromJson(res.data);
      return response.articles;
      // } on DioError {
      // rethrow;
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Failed to load post: $e");
    }
  }

  // Future<Video> fetchPosts() async {
  //   try {
  //     // final response = await dio.get(postsEndpoint + "/$postId");
  //     final response = await dio.get(youtubeApiPath, queryParameters: {
  //       'key': _apiKey,
  //       'type': 'video',
  //       'part': 'snippet',
  //       'q': 'guitar',
  //     });
  //     // debugPrint(response.data);
  //     // print(response.data)
  //     final data = Video.fromJson(response.data);
  //     return data;
  //   } on DioError catch (e) {
  //     debugPrint("Status code: ${e.response?.statusCode.toString()}");
  //     debugPrint("Status code: ${e.response}");
  //     throw Exception("Failed to load post: $e");
  //   }
  // }

  // Future<List<Post>> fetchPosts() async {
  //   final url = Uri.parse()
  // }
}
