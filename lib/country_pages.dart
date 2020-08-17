import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/main_pages.dart';
import 'package:flutternews/model/category_model.dart';

class CountryPages extends StatefulWidget {
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

  @override
  _CountryPagesState createState() => _CountryPagesState();
}

class _CountryPagesState extends State<CountryPages> {
  TextEditingController editingController = TextEditingController();
  List<NationModel> _nation = new List<NationModel>();
  var _items = List<dynamic>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nation = getNation();
    _items.addAll(widget.duplicateItems);
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: _list(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _search(String x) {
    if (x.isNotEmpty) {
      for (int i = 0; i < _nation.length; i++) {
        if (_nation[i].nationName == x) {
          print(x);
          print(_nation);
        }
      }
    }
  }

  Widget _list() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: _nation.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPages(
                              country: _nation[index].id,
                              countryName: _nation[index].nationName,
                              countryFlag: _nation[index].image,
                            )));
              },
              child: Container(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: _nation[index].image,
                        width: 110,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      _nation[index].nationName,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void filterSearch(String query) {
    var dummy;
    dummy.add(_nation.length);
    if (query.isNotEmpty) {
      var dummyData;
      dummy.forEach((item) {
        if (item.contains(query)) {
          dummyData.add(_items);
          print(dummyData.toString());
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(dummyData);
      });
      return;
    } else {
      setState(() {
        _items.clear();
        _items.addAll(_items);
      });
    }
  }

  void filterSearchResults(String query) {
    print(query);
    var dummySearchList;
    dummySearchList.addAll(widget.duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _items.clear();
        _items.addAll(widget.duplicateItems);
      });
    }
  }
}
