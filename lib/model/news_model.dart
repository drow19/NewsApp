class NewsModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAt;

  NewsModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.publishedAt});

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
      publishedAt: DateTime.parse(json['publishedAt'])
    );
  }
}
