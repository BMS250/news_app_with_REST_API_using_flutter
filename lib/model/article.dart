class Article {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  Article({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],
  );
}