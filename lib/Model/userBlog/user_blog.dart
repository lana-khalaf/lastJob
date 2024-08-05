// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_jobs_app/Model/owner_job.dart';
import 'package:flutter_jobs_app/Model/userBlog/community.dart';
import 'package:flutter_jobs_app/Model/userBlog/owner_user_blog.dart';

class UserBlogs {
   final int id;
  final OwnerUSerBlog owner;
  final String title;
  final String body;
  final String? excerpt;
  final CommunityUserBlog community;
  final bool edited;
  final String createdAt;
  final List<dynamic> images;
  UserBlogs({
    required this.id,
    required this.owner,
    required this.title,
    required this.body,
    this.excerpt,
    required this.community,
    required this.edited,
    required this.createdAt,
    required this.images,
  });
  

  UserBlogs copyWith({
    int? id,
    OwnerUSerBlog? owner,
    String? title,
    String? body,
    String? excerpt,
    CommunityUserBlog? community,
    bool? edited,
    String? createdAt,
    List<dynamic>? images,
  }) {
    return UserBlogs(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      title: title ?? this.title,
      body: body ?? this.body,
      excerpt: excerpt ?? this.excerpt,
      community: community ?? this.community,
      edited: edited ?? this.edited,
      createdAt: createdAt ?? this.createdAt,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'owner': owner.toMap(),
      'title': title,
      'body': body,
      'excerpt': excerpt,
      'community': community.toMap(),
      'edited': edited,
      'createdAt': createdAt,
      'images': images,
    };
  }

  factory UserBlogs.fromMap(Map<String, dynamic> map) {
    return UserBlogs(
      id: map['id'] as int,
      owner: OwnerUSerBlog.fromMap(map['owner'] as Map<String,dynamic>),
      title: map['title'] as String,
      body: map['body'] as String,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      community: CommunityUserBlog.fromMap(map['community'] as Map<String,dynamic>),
      edited: map['edited'] as bool,
      createdAt: map['createdAt'] as String,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBlogs.fromJson(String source) => UserBlogs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBlogs(id: $id, owner: $owner, title: $title, body: $body, excerpt: $excerpt, community: $community, edited: $edited, createdAt: $createdAt, images: $images)';
  }

  @override
  bool operator ==(covariant UserBlogs other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.owner == owner &&
      other.title == title &&
      other.body == body &&
      other.excerpt == excerpt &&
      other.community == community &&
      other.edited == edited &&
      other.createdAt == createdAt &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      owner.hashCode ^
      title.hashCode ^
      body.hashCode ^
      excerpt.hashCode ^
      community.hashCode ^
      edited.hashCode ^
      createdAt.hashCode ^
      images.hashCode;
  }
}
