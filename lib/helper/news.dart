import 'dart:convert';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=7336f85184d64a1f8aee30b1100d818e";
    // ignore: unused_local_variable
    var response = await http.get(url as Uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          // ignore: unused_local_variable
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7336f85184d64a1f8aee30b1100d818e";
    // ignore: unused_local_variable
    var response = await http.get(url as Uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          // ignore: unused_local_variable
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
