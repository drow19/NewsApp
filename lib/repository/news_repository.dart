import 'dart:convert';
import 'package:flutternews/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  Future<List<NewsModel>> getData(String category) async {
    String _url = "";

    if(category == null){
      _url = "https://newsapi.org/v2/top-headlines?country=id&apiKey=fcb76749a2d44655a29e1e5741da827e";
    }else{
      _url = "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=fcb76749a2d44655a29e1e5741da827e";
    }

    final response = await http.get(_url);

    if (response.statusCode == 200) {
     return jsonParsed(response.body);
    } else {
      throw Exception();
    }
  }

  List<NewsModel> jsonParsed(final response) {
    final json = jsonDecode(response);
    final data = json['articles'];

    print("response data : " + data.toString());

    return new List<NewsModel>.from(data.map((e) => NewsModel.fromJson(e)));
  }
}
