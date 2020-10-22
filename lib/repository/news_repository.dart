import 'dart:convert';
import 'package:flutternews/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  Future<List<NewsModel>> getData(String category, String country) async {
    String _url = "";

    country == null ? country = "id" : country = country;
    print(country);

    if(category == null){
      _url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=<YOUR_APIKEY>";
    }else{
      _url = "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=<YOUR_APIKEY>";
    }

    print(_url);

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
