// To parse this JSON data, do
//
//     final bollyWoodData = bollyWoodDataFromJson(jsonString);

import 'dart:convert';

BollyWoodData bollyWoodDataFromJson(String str) => BollyWoodData.fromJson(json.decode(str));

String bollyWoodDataToJson(BollyWoodData data) => json.encode(data.toJson());

class BollyWoodData {
  String? status;
  int? count;
  int? countTotal;
  int? pages;
  Category? category;
  List<Posts>? posts;

  BollyWoodData(
      {this.status,
        this.count,
        this.countTotal,
        this.pages,
        this.category,
        this.posts});

  BollyWoodData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    countTotal = json['count_total'];
    pages = json['pages'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    data['count_total'] = this.countTotal;
    data['pages'] = this.pages;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? cid;
  String? categoryName;
  String? categoryImage;

  Category({this.cid, this.categoryName, this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}

class Posts {
  int? vid;
  int? catId;
  String? videoTitle;
  String? videoUrl;
  String? videoId;
  String? videoThumbnail;
  String? videoDuration;
  String? videoDescription;
  String? videoType;
  String? size;
  int? totalViews;
  String? dateTime;
  String? categoryName;

  Posts(
      {this.vid,
        this.catId,
        this.videoTitle,
        this.videoUrl,
        this.videoId,
        this.videoThumbnail,
        this.videoDuration,
        this.videoDescription,
        this.videoType,
        this.size,
        this.totalViews,
        this.dateTime,
        this.categoryName});

  Posts.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    catId = json['cat_id'];
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
    videoId = json['video_id'];
    videoThumbnail = json['video_thumbnail'];
    videoDuration = json['video_duration'];
    videoDescription = json['video_description'];
    videoType = json['video_type'];
    size = json['size'];
    totalViews = json['total_views'];
    dateTime = json['date_time'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['cat_id'] = this.catId;
    data['video_title'] = this.videoTitle;
    data['video_url'] = this.videoUrl;
    data['video_id'] = this.videoId;
    data['video_thumbnail'] = this.videoThumbnail;
    data['video_duration'] = this.videoDuration;
    data['video_description'] = this.videoDescription;
    data['video_type'] = this.videoType;
    data['size'] = this.size;
    data['total_views'] = this.totalViews;
    data['date_time'] = this.dateTime;
    data['category_name'] = this.categoryName;
    return data;
  }
}
