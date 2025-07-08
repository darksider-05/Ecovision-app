import "package:http/http.dart" as http;
import "dart:convert";
import 'package:flutter/foundation.dart';


class NewsModel extends ChangeNotifier {
  List<Map<String, dynamic>> _allNews = [];
  List<Map<String, dynamic>> _ecoNews = [];
  List<Map<String, dynamic>> _finNews = [];
  List<Map<String, dynamic>> _marNews = [];
  List<Map<String, dynamic>> _invNews = [];
  List<Map<String, dynamic>> _tecNews = [];
  List<Map<String, dynamic>> _sciNews = [];
  List<Map<String, dynamic>> _curData = [];

  List<Map<String, dynamic>> get allNews => _allNews;
  List<Map<String, dynamic>> get ecoNews => _ecoNews;
  List<Map<String, dynamic>> get finNews => _finNews;
  List<Map<String, dynamic>> get marNews => _marNews;
  List<Map<String, dynamic>> get invNews => _invNews;
  List<Map<String, dynamic>> get tecNews => _tecNews;
  List<Map<String, dynamic>> get sciNews => _sciNews;
  List<Map<String, dynamic>> get curData => _curData;



  List<Map<String, dynamic>> getNewsListByKey(String key) {
    switch (key) {
      case 'allNews':
        return _allNews;
      case 'ecoNews':
        return _ecoNews;
      case 'finNews':
        return _finNews;
      case 'marNews':
        return _marNews;
      case 'invNews':
        return _invNews;
      case 'tecNews':
        return _tecNews;
      case 'sciNews':
        return _sciNews;
      case 'curData':
        return _curData;
      default:
        return [];
    }
  }


  Future<void> fetchNewsAll(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/news");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _allNews = List<Map<String, dynamic>>.from(data);
          notifyListeners();// Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
    throw Exception("Failed to load news. Status code: ${response.statusCode}");
    }
  } catch (e) {
  debugPrint("Error fetching news: $e");
  }
}


  Future<void> fetchNewsEco(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/economy");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _ecoNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsFin(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/finance");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _finNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsMar(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/economy");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _marNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsInv(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/investing");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _invNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsTec(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/tecnology");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _tecNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsSci(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/science");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data = data["newsData"];

        if (data is List) {
          _sciNews = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  Future<void> fetchNewsCur(String ip) async{
    final url = Uri.parse("http://$ip:8000/api/crypto");


    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data is List) {
          _curData = List<Map<String, dynamic>>.from(data);
          notifyListeners(); // Notify UI to rebuild
        } else {
          throw Exception("Expected a list of maps, got something else.");
        }
      } else {
        throw Exception("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }


}