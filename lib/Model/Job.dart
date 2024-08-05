// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_jobs_app/Model/Mini_job.dart';

class Job {
    final MiniJob job;
  final bool? status;
  final String? judgedAt;
  final String createdAt;
  Job({
    required this.job,
    this.status,
    this.judgedAt,
    required this.createdAt,
  });


  Job copyWith({
    MiniJob? job,
    bool? status,
    String? judgedAt,
    String? createdAt,
  }) {
    return Job(
      job: job ?? this.job,
      status: status ?? this.status,
      judgedAt: judgedAt ?? this.judgedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'job': job.toMap(),
      'status': status,
      'judgedAt': judgedAt,
      'createdAt': createdAt,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      job: MiniJob.fromMap(map['job'] as Map<String,dynamic>),
      status: map['status'] != null ? map['status'] as bool : null,
      judgedAt: map['judgedAt'] != null ? map['judgedAt'] as String : null,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(job: $job, status: $status, judgedAt: $judgedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;
  
    return 
      other.job == job &&
      other.status == status &&
      other.judgedAt == judgedAt &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return job.hashCode ^
      status.hashCode ^
      judgedAt.hashCode ^
      createdAt.hashCode;
  }
}
