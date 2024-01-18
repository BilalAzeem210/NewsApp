import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_channel_headlines_model.dart';

class NewsRepository{

  Future<NewsChannelHeadlinesModel> fetchBbcHeadlinesApi () async{
   try{
     String url = 'https://newsapi.org/v2/top-headlines/?sources=bbc-news&apiKey=b3b8a715138a429780001ea1e50d1295';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      if (kDebugMode) {
        print(body);
      }
      return NewsChannelHeadlinesModel.fromJson(body);

    }
   }
   catch(e){
     if (kDebugMode) {
       print(e.toString());
     }
     throw Error();
   }
    throw Exception('error');

  }
  Future<NewsChannelHeadlinesModel> fetchCnnHeadlinesApi () async{
    try{
      String url = 'https://newsapi.org/v2/top-headlines/?sources=cnn&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
        return NewsChannelHeadlinesModel.fromJson(body);

      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw Error();
    }
    throw Exception('error');

  }
  Future<NewsChannelHeadlinesModel> fetchAryNewsHeadlinesApi () async{
    try{
      String url = 'https://newsapi.org/v2/top-headlines/?sources=ary-news&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
        return NewsChannelHeadlinesModel.fromJson(body);

      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw Error();
    }
    throw Exception('error');

  }
  Future<NewsChannelHeadlinesModel> fetchReutersHeadlinesApi () async{
    try{
      String url = 'https://newsapi.org/v2/top-headlines/?sources=reuters&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
        return NewsChannelHeadlinesModel.fromJson(body);

      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw Error();
    }
    throw Exception('error');

  }
  Future<NewsChannelHeadlinesModel> fetchAlJazeeraHeadlinesApi () async{
    try{
      String url = 'https://newsapi.org/v2/top-headlines/?sources=al-jazeera&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
        return NewsChannelHeadlinesModel.fromJson(body);

      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw Error();
    }
    throw Exception('error');

  }

  Future<NewsChannelHeadlinesModel> fetchBloombergHeadlinesApi () async{
    try{
      String url = 'https://newsapi.org/v2/top-headlines/?sources=bloomberg&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if (kDebugMode) {
          print(body);
        }
        return NewsChannelHeadlinesModel.fromJson(body);

      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw Error();
    }
    throw Exception('error');

  }

}