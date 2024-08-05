// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_jobs_app/Model/job_type_Job.dart';
import 'package:flutter_jobs_app/Model/owner_job.dart';

class MiniJob {
    final num id;
  final Owner owner;
  final String title;
  final String body;
  final String? excerpt;
  final JobType jobType;
  final num minmumSalary;
  final num maximumSalary;
  final String createdAt;
  MiniJob({
    required this.id,
    required this.owner,
    required this.title,
    required this.body,
    this.excerpt,
    required this.jobType,
    required this.minmumSalary,
    required this.maximumSalary,
    required this.createdAt,
  });
  

  MiniJob copyWith({
    num? id,
    Owner? owner,
    String? title,
    String? body,
    String? excerpt,
    JobType? jobType,
    num? minmumSalary,
    num? maximumSalary,
    String? createdAt,
  }) {
    return MiniJob(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      title: title ?? this.title,
      body: body ?? this.body,
      excerpt: excerpt ?? this.excerpt,
      jobType: jobType ?? this.jobType,
      minmumSalary: minmumSalary ?? this.minmumSalary,
      maximumSalary: maximumSalary ?? this.maximumSalary,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'owner': owner.toMap(),
      'title': title,
      'body': body,
      'excerpt': excerpt,
      'jobType': jobType.toMap(),
      'minmumSalary': minmumSalary,
      'maximumSalary': maximumSalary,
      'createdAt': createdAt,
    };
  }

  factory MiniJob.fromMap(Map<String, dynamic> map) {
    return MiniJob(
      id: map['id'] as num,
      owner: Owner.fromMap(map['owner'] as Map<String,dynamic>),
      title: map['title'] as String,
      body: map['body'] as String,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      jobType: JobType.fromMap(map['jobType'] as Map<String,dynamic>),
      minmumSalary: map['minmumSalary'] as num,
      maximumSalary: map['maximumSalary'] as num,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MiniJob.fromJson(String source) => MiniJob.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MiniJob(id: $id, owner: $owner, title: $title, body: $body, excerpt: $excerpt, jobType: $jobType, minmumSalary: $minmumSalary, maximumSalary: $maximumSalary, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant MiniJob other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.owner == owner &&
      other.title == title &&
      other.body == body &&
      other.excerpt == excerpt &&
      other.jobType == jobType &&
      other.minmumSalary == minmumSalary &&
      other.maximumSalary == maximumSalary &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      owner.hashCode ^
      title.hashCode ^
      body.hashCode ^
      excerpt.hashCode ^
      jobType.hashCode ^
      minmumSalary.hashCode ^
      maximumSalary.hashCode ^
      createdAt.hashCode;
  }
}
