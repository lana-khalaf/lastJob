// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Education {
  num id ;
  num userId;
  String? title;
  String university;
  String major;
String specialization;
bool? graduated;
  String startedAt;
  String? endedAt;
  Education({
    required this.id,
    required this.userId,
    this.title,
    required this.university,
    required this.major,
    required this.specialization,
    this.graduated,
    required this.startedAt,
    this.endedAt,
  });

  Education copyWith({
    num? id ,
    num? userId,
    String? title,
    String? university,
    String? major,
    String? specialization,
    bool? graduated,
    String? startedAt,
    String? endedAt,
  }) {
    return Education(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      university: university ?? this.university,
      major: major ?? this.major,
      specialization: specialization ?? this.specialization,
      graduated: graduated ?? this.graduated,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'university': university,
      'major': major,
      'specialization': specialization,
      'graduated': graduated,
      'startedAt': startedAt,
      'endedAt': endedAt,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
       id: map['id'] as num,
      userId: map['userId'] as num,
      title: map['title'] != null ? map['title'] as String : null,
      university: map['university'] as String,
      major: map['major'] as String,
      specialization: map['specialization'] as String,
      graduated: map['graduated'] != null ? map['graduated'] as bool : null,
      startedAt: map['startedAt'] as String,
      endedAt: map['endedAt'] != null ? map['endedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) => Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(id: $id, userId: $userId, title: $title, university: $university, major: $major, specialization: $specialization, graduated: $graduated, startedAt: $startedAt, endedAt: $endedAt)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.title == title &&
      other.university == university &&
      other.major == major &&
      other.specialization == specialization &&
      other.graduated == graduated &&
      other.startedAt == startedAt &&
      other.endedAt == endedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      university.hashCode ^
      major.hashCode ^
      specialization.hashCode ^
      graduated.hashCode ^
      startedAt.hashCode ^
      endedAt.hashCode;
  }
}
