import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/country_pages.dart';
import 'package:flutternews/detail_news.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/model/category_model.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/repository/news_repository.dart';

class MainPages extends StatefulWidget {
  final String category;
  final String country;
  final String countryName;
  final String countryFlag;

  MainPages({this.category, this.country, this.countryName, this.countryFlag});

  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List<CategoryModel> _category = new List<CategoryModel>();
  List<NewsModel> _news = new List<NewsModel>();

  Future<String> getNews() async {
    print(widget.category);
    _news = await NewsRepository().getData(widget.category, widget.country);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _category = getCategory();
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
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CountryPages()));
              },
              child: Stack(
                children: [
                  Container(
                    margin: new EdgeInsets.fromLTRB(0, 12, 12, 12),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: NetworkImage(widget.countryFlag ??
                              "https://www.worldometers.info/img/flags/small/tn_id-flag.gif"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 6),
              height: 80,
              child: ListView.builder(
                  itemCount: _category.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: _category[index].categoryName,
                      image: _category[index].image,
                      country: widget.country,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Error",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffdf678c),
                          fontFamily: 'Spectral'),
                    ),
                    Text(" "),
                    Text(
                      "Connection",
                      style: TextStyle(
                          fontSize: 18,
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
  final String country;

  CategoryTile({this.categoryName, this.image, this.country});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainPages(
                      category: categoryName.toLowerCase(),
                      country: country,
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
