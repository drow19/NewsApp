import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/detail_news.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/model/category_model.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/repository/news_repository.dart';

class MainPages extends StatefulWidget {
  final String category;

  MainPages({this.category});

  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  /* var _country = [
    {"id": "ae", "country_name": "UAE"},
    {"id": "ar", "country_name": "Argentina"},
    {"id": "at", "country_name": "Austria"},
    {"id": "au", "country_name": "Australia"},
    {"id": "be", "country_name": "Belgium"},
    {"id": "bg", "country_name": "Bulgaria"},
    {"id": "br", "country_name": "Brazil"},
    {"id": "ca", "country_name": "Canada"},
    {"id": "ch", "country_name": "Switzerland"},
    {"id": "cn", "country_name": "China"},
    {"id": "co", "country_name": "Colombia"},
    {"id": "cu", "country_name": "Cuba"},
    {"id": "cz", "country_name": "Czech Republic"},
    {"id": "de", "country_name": "Germany"},
    {"id": "eg", "country_name": "Egypt"},
    {"id": "fr", "country_name": "France"},
    {"id": "gb", "country_name": "United Kingdom"},
    {"id": "gr", "country_name": "Greece"},
    {"id": "hk", "country_name": "Hong Kong"},
    {"id": "hu", "country_name": "Hungary"},
    {"id": "id", "country_name": "Indonesia"},
    {"id": "ie", "country_name": "Ireland"},
    {"id": "il", "country_name": "Israel"},
    {"id": "in", "country_name": "India"},
    {"id": "it", "country_name": "Italy"},
    {"id": "jp", "country_name": "Japan"},
    {"id": "kr", "country_name": "South Korea"},
    {"id": "lt", "country_name": "Lihuania"},
    {"id": "lv", "country_name": "Latvia"},
    {"id": "ma", "country_name": "Morocco"},
    {"id": "mx", "country_name": "Mexico"},
    {"id": "my", "country_name": "Malaysia"},
    {"id": "ng", "country_name": "Nigeria"},
    {"id": "nl", "country_name": "Netherlands"},
    {"id": "no", "country_name": "Norway"},
    {"id": "nz", "country_name": "New Zealand"},
    {"id": "ph", "country_name": "Philippines"},
    {"id": "pl", "country_name": "Poland"},
    {"id": "pt", "country_name": "Portugal"},
    {"id": "ro", "country_name": "Romania"},
    {"id": "rs", "country_name": "Serbia"},
    {"id": "ru", "country_name": "Russia"},
    {"id": "sa", "country_name": "Saudi Arabia"},
    {"id": "se", "country_name": "Sweden"},
    {"id": "sg", "country_name": "Singapore"},
    {"id": "si", "country_name": "Slovenia"},
    {"id": "sk", "country_name": "Slovakia"},
    {"id": "th", "country_name": "Thailand"},
    {"id": "tr", "country_name": "Turkey"},
    {"id": "tw", "country_name": "Taiwan"},
    {"id": "ua", "country_name": "Ukraine"},
    {"id": "us", "country_name": "United States"},
    {"id": "ve", "country_name": "Venezuela"},
    {"id": "za", "country_name": "South Africa"},
  ];*/

  List<CategoryModel> category = new List<CategoryModel>();
  List<NewsModel> _news = new List<NewsModel>();

  Future<String> getNews() async {
    print(widget.category);
    _news = await NewsRepository().getData(widget.category);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Flutter",
              style:
                  TextStyle(color: Color(0xffdf678c), fontFamily: 'Spectral'),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: Color(0xff3d155f), fontFamily: 'Spectral'),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 6),
              height: 80,
              child: ListView.builder(
                  itemCount: category.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: category[index].categoryName,
                      image: category[index].image,
                    );
                  }),
            ),
            Flexible(child: Container(child: _loadData()))
          ],
        ),
      ),
    );
  }

  Widget _loadData() {
    return FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Row(
                  children: [
                    Text(
                      "Error",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffdf678c),
                          fontFamily: 'Spectral'),
                    ),
                    Text(
                      "Connection",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff3d155f),
                          fontFamily: 'Spectral'),
                    ),
                  ],
                ),
              );
            } else {
              return _listNews();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _listNews() {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: _news.length,
          itemBuilder: (context, index) {
            if (_news[index].urlToImage != "" &&
                _news[index].author != "" &&
                _news[index].description != "") {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailNews(
                            url: _news[index].url,
                          )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          _news[index].urlToImage,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _news[index].title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _news[index].description,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final image;

  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainPages(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.black26,
              width: 120,
              height: 80,
              child: Text(
                categoryName,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
