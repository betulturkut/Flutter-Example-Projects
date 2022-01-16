import 'dart:convert';

import 'package:basic_news_app/model/articles.dart';
import 'package:basic_news_app/model/news.dart';
import 'package:http/http.dart' as http;

class NewsService{
  static final NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService(){
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async{
   String url = "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=983b54c5671841f1beb558c339bc1568";

   final response = await http.get(Uri.parse(url));

   if(response.body.isNotEmpty){
     final responseJson = json.decode(response.body);
     News news = News.fromJson(responseJson);
     return news.articles;
   }
   return null;
  }
}