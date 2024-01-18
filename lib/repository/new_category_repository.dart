

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/new_category_headlines_model.dart';

class NewsCategoryRepository{

  Future<NewCategoryHeadlinesModel> fetchGeneralHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=general&apiKey=b3b8a715138a429780001ea1e50d1295';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        if(kDebugMode){
          print(responce.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);
      }


    }
        catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
        }

      throw Exception();
  }

  Future<NewCategoryHeadlinesModel> fetchEntertainmentHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=entertainment&apiKey=b3b8a715138a429780001ea1e50d1295';
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        if(kDebugMode){
          print(response.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);

  }

    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
    }
    throw Exception();
  }

  Future<NewCategoryHeadlinesModel> fetchHealthHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=health&apiKey=b3b8a715138a429780001ea1e50d1295';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        if(kDebugMode){
          print(responce.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);
      }
    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
    }
      throw Exception();


  }

  Future<NewCategoryHeadlinesModel> fetchSportHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=sports&apiKey=b3b8a715138a429780001ea1e50d1295';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        if(kDebugMode){
          print(responce.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);
      }
    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
    }
    throw Exception();
  }

  Future<NewCategoryHeadlinesModel> fetchBusinessHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=business&apiKey=b3b8a715138a429780001ea1e50d1295';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        if(kDebugMode){
          print(responce.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);
      }
    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
    }
    throw Exception();
  }

  Future<NewCategoryHeadlinesModel> fetchTechnologyHeadlines() async{
    try{
      String url = 'https://newsapi.org/v2/everything?q=technology&apiKey=b3b8a715138a429780001ea1e50d1295';
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        final body = jsonDecode(responce.body);
        if(kDebugMode){
          print(responce.body);
        }
        return NewCategoryHeadlinesModel.fromJson(body);
      }
    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      throw Error();
    }
    throw Exception();
  }


}