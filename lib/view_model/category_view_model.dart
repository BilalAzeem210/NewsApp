
import 'package:flutter/foundation.dart';
import 'package:newsapp/repository/new_category_repository.dart';

class CategoryViewModel with ChangeNotifier{
  final _repo = NewsCategoryRepository();
  var _getCategoryHeadlines;

  dynamic get categoryNewsHeadlines {
    return _getCategoryHeadlines;
  }

  Future<void> fetchGeneralCategoryNews() async{
    _getCategoryHeadlines = await _repo.fetchGeneralHeadlines();
    notifyListeners();
  }


  Future<bool> fetchCategoryNewsHeadlines(String source) async{
    try{
      await fetchGeneralCategoryNews();
      return true;
    }
    catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      return false;
    }
  }

  Future<void> fetchEntertainmentNews() async{
    _getCategoryHeadlines = await _repo.fetchEntertainmentHeadlines();
    if (kDebugMode) {
      print("fetching entertainment news");
    }
    notifyListeners();
  }

  Future<void> fetchHealthNews() async{
    _getCategoryHeadlines = await _repo.fetchHealthHeadlines();
    if (kDebugMode) {
      print("fetching health news");
    }
    notifyListeners();
  }

  Future<void> fetchSportsNews() async{
    _getCategoryHeadlines = await _repo.fetchSportHeadlines();
    if (kDebugMode) {
      print("fetching sports news");
    }
    notifyListeners();
  }

  Future<void> fetchBusinessNews() async{
    _getCategoryHeadlines = await _repo.fetchBusinessHeadlines();

    if (kDebugMode) {
      print("fetching business news");
    }
    notifyListeners();
  }

  Future<void> fetchTechnologyNews() async{
    _getCategoryHeadlines = await _repo.fetchTechnologyHeadlines();
    if (kDebugMode) {
      print("fetching technology news");
    }
    notifyListeners();
  }
}