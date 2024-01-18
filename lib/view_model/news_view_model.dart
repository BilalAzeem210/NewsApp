
import 'package:flutter/foundation.dart';
import 'package:newsapp/repository/news_repository.dart';

class NewsViewModel with ChangeNotifier{
  final _repo = NewsRepository();
  var _getChannelHeadlies;

  dynamic get newsChannelHeadlines {
    return _getChannelHeadlies;
}

  Future<void> fetchBbcNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchBbcHeadlinesApi();
    notifyListeners();
}

  Future<bool> fetchNewsChannelHeadlines(String source) async{
     try{
       await fetchBbcNewsHeadlines();
       return true;
     }
     catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
       return false;
     }


  }
  Future<void> fetchCnnNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchCnnHeadlinesApi();
    notifyListeners();
  }

  Future<void> fetchAryNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchAryNewsHeadlinesApi();
    notifyListeners();
  }

  Future<void> fetchRecuterNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchReutersHeadlinesApi();
    notifyListeners();
  }

  Future<void> fetchAlJazeeraNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchAlJazeeraHeadlinesApi();
    notifyListeners();
  }
  Future<void> fetchBloombergNewsHeadlines() async{
    _getChannelHeadlies = await _repo.fetchBloombergHeadlinesApi();
    notifyListeners();
  }

}