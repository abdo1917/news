class SourcesResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourcesResponse({
    this.status,
    this.sources,
    this.code,
    this.message});

  SourcesResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    if (json["sources"] != null) {
      sources = [];
      json["sources"].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    if (sources != null) {
      map["sources"] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "argaam"
/// name : "Argaam"
/// description : "ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده "
/// url : "http://www.argaam.com"
/// category : "business"
/// language : "ar"
/// country : "sa"

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country});

  Source.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["url"] = url;
    map["category"] = category;
    map["language"] = language;
    map["country"] = country;
    return map;
  }

}