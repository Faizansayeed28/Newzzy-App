import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    try {
      String url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4a2ef33f492c4cdb850ee980e09cd3b3";
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element["urlToImage"] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element["url"],
              urlToImage: element["urlToImage"],
            );
            news.add(articleModel);
          }
        });
      }
    } catch (err) {
      debugPrint("error");
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    try {
      String url =
          "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=4a2ef33f492c4cdb850ee980e09cd3b3";
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element["urlToImage"] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element["url"],
              urlToImage: element["urlToImage"],
            );
            news.add(articleModel);
          }
        });
      }
    } catch (err) {
      debugPrint("error");
    }
  }
}
