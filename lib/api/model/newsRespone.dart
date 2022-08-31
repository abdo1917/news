import 'Sourcersreponse.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<News>? articles;

  NewsResponse({
    this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles});

  NewsResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Kevin O'Gorman: Pay-outs for victims of disgraced academic"
/// description : "Heriot-Watt and Strathclyde reach a financial settlement with two of Kevin O'Gorman's victims."
/// url : "https://www.bbc.co.uk/news/uk-scotland-62707039"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/16C6C/production/_108229239_kevinogorman.jpg"
/// publishedAt : "2022-08-28T16:41:56Z"
/// content : "Students who were sexually abused by an academic while studying at Scottish universities have received compensation.\r\nHeriot-Watt and Strathclyde universities have issued five-figure settlements to a… [+3162 chars]"

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content});

  News.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

}
