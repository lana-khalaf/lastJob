// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SkillCreate {
  String title;
  String? body;
  String? excerpt;
   DateTime StartedAt ;
  DateTime? EndedAt;
  SkillCreate({
    required this.title,
    this.body,
    this.excerpt,
    required this.StartedAt,
    this.EndedAt,
  });


  SkillCreate copyWith({
    String? title,
    String? body,
    String? excerpt,
    DateTime? StartedAt ,
    DateTime? EndedAt,
  }) {
    return SkillCreate(
      title: title ?? this.title,
      body: body ?? this.body,
      excerpt: excerpt ?? this.excerpt,
      StartedAt: StartedAt ?? this.StartedAt,
      EndedAt: EndedAt ?? this.EndedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'excerpt': excerpt,
      'StartedAt': StartedAt.millisecondsSinceEpoch,
      'EndedAt': EndedAt?.millisecondsSinceEpoch,
    };
  }

  factory SkillCreate.fromMap(Map<String, dynamic> map) {
    return SkillCreate(
      title: map['title'] as String,
      body: map['body'] != null ? map['body'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
       StartedAt: DateTime.fromMillisecondsSinceEpoch(map['StartedAt'] as int),
      EndedAt: map['EndedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['EndedAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillCreate.fromJson(String source) => SkillCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Skill(title: $title, body: $body, excerpt: $excerpt, StartedAt: $StartedAt, EndedAt: $EndedAt)';
  }

  @override
  bool operator ==(covariant SkillCreate other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body &&
      other.excerpt == excerpt &&
      other.StartedAt == StartedAt &&
      other.EndedAt == EndedAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      body.hashCode ^
      excerpt.hashCode ^
      StartedAt.hashCode ^
      EndedAt.hashCode;
  }
}
