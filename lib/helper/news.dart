import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=fd3197740b714a0e9d7c3a1c065c36c7";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);
  
  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] != null){

        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"]
        );

        news.add(articleModel);
      }

    });
  }
  }

}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=fd3197740b714a0e9d7c3a1c065c36c7";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);
  
  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] != null){

        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"]
        );

        news.add(articleModel);
      }

    });
  }
  }

}

