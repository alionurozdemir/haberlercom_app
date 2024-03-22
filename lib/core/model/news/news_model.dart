import 'package:haberlercom_app/core/model/base_models.dart';

class NewsModel extends BaseModel<NewsModel> {
  List<News>? news;

  NewsModel({this.news});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  NewsModel fromJson(Map<String, dynamic>? json) {
    return NewsModel.fromJson(json ?? {});
  }
}

class News {
  String? category;
  String? title;
  String? spot;
  bool? redirects;
  bool? isAdvertorial;
  bool? adaptive;
  String? publishDate;
  int? id;
  String? imageUrl;
  String? videoUrl;
  String? webUrl;
  int? commentCount;
  int? totalComment;
  String? imageSize;
  List<Body>? body;
  List<dynamic>? related;
  String? embedHtml;
  Emoji? emoji;

  News(
      {this.category,
      this.title,
      this.spot,
      this.redirects,
      this.isAdvertorial,
      this.adaptive,
      this.publishDate,
      this.id,
      this.imageUrl,
      this.videoUrl,
      this.webUrl,
      this.commentCount,
      this.totalComment,
      this.imageSize,
      this.body,
      this.related,
      this.embedHtml,
      this.emoji});

  News.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    spot = json['spot'];
    redirects = json['redirects'];
    isAdvertorial = json['isAdvertorial'];
    adaptive = json['adaptive'];
    publishDate = json['publishDate'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    webUrl = json['webUrl'];
    commentCount = json['commentCount'];
    totalComment = json['totalComment'];
    imageSize = json['imageSize'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
    if (json['related'] != null) {
      related = [];
      json['related'].forEach((v) {
        related!.add(v);
      });
    }
    embedHtml = json['embedHtml'];
    emoji = json['emoji'] != null ? Emoji.fromJson(json['emoji']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['title'] = title;
    data['spot'] = spot;
    data['redirects'] = redirects;
    data['isAdvertorial'] = isAdvertorial;
    data['adaptive'] = adaptive;
    data['publishDate'] = publishDate;
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['videoUrl'] = videoUrl;
    data['webUrl'] = webUrl;
    data['commentCount'] = commentCount;
    data['totalComment'] = totalComment;
    data['imageSize'] = imageSize;
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    if (related != null) {
      data['related'] = [];
    }
    data['embedHtml'] = embedHtml;
    if (emoji != null) {
      data['emoji'] = emoji!.toJson();
    }
    return data;
  }
}

class Body {
  String? p;
  String? inpageAd;
  String? inpageSize;
  bool? adaptive;
  String? h3;
  String? image;
  String? imageSize;
  List<String>? ul;
  String? caption;

  Body(
      {this.p,
      this.inpageAd,
      this.inpageSize,
      this.adaptive,
      this.h3,
      this.image,
      this.imageSize,
      this.ul,
      this.caption});

  Body.fromJson(Map<String, dynamic> json) {
    p = json['p'];
    inpageAd = json['inpageAd'];
    inpageSize = json['inpageSize'];
    adaptive = json['adaptive'];
    h3 = json['h3'];
    image = json['image'];
    imageSize = json['imageSize'];
    ul = json['ul']?.cast<String>();
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p'] = p;
    data['inpageAd'] = inpageAd;
    data['inpageSize'] = inpageSize;
    data['adaptive'] = adaptive;
    data['h3'] = h3;
    data['image'] = image;
    data['imageSize'] = imageSize;
    data['ul'] = ul;
    data['caption'] = caption;
    return data;
  }
}

class Emoji {
  int? loved;
  int? clappingHand;
  int? thumbsDown;
  int? smiling;
  int? crying;
  int? angry;
  int? suprised;

  Emoji(
      {this.loved,
      this.clappingHand,
      this.thumbsDown,
      this.smiling,
      this.crying,
      this.angry,
      this.suprised});

  Emoji.fromJson(Map<String, dynamic> json) {
    loved = json['loved'];
    clappingHand = json['clappingHand'];
    thumbsDown = json['thumbsDown'];
    smiling = json['smiling'];
    crying = json['crying'];
    angry = json['angry'];
    suprised = json['suprised'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loved'] = loved;
    data['clappingHand'] = clappingHand;
    data['thumbsDown'] = thumbsDown;
    data['smiling'] = smiling;
    data['crying'] = crying;
    data['angry'] = angry;
    data['suprised'] = suprised;
    return data;
  }
}
