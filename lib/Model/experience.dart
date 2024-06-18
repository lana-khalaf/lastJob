// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Experience {
  num id;
  num userId;
  String title;
  String? body;
  String? excerpt;
  String startedAt;
  String? endedAt;
  Experience({
    required this.id,
    required this.userId,
    required this.title,
    this.body,
    this.excerpt,
    required this.startedAt,
    this.endedAt,
  });

  Experience copyWith({
    num? id,
    num? userId,
    String? title,
    String? body,
    String? excerpt,
    String? startedAt,
    String? endedAt,
  }) {
    return Experience(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      excerpt: excerpt ?? this.excerpt,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'excerpt': excerpt,
      'startedAt': startedAt,
      'endedAt': endedAt,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id'] as num,
      userId: map['userId'] as num,
      title: map['title'] as String,
      body: map['body'] != null ? map['body'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      startedAt: map['startedAt'] as String,
      endedAt: map['endedAt'] != null ? map['endedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source) as Map<String, dynamic>);
  
  // عدلت هوون لانو صار يطلع هال  error  Error: type '_Map<String, dynamic>' is not a subtype of type 'String'
factory Experience.fromJson(Map<String, dynamic> map) {
  return Experience(
    id: map['id'] as num,
    userId: map['userId'] as num,
    title: map['title'] as String,
    body: map['body'] as String?, // يمكن أن تكون قيمة null
    excerpt: map['excerpt'] as String?, // يمكن أن تكون قيمة null
    startedAt: map['startedAt'] as String,
    endedAt: map['endedAt'] as String?, // يمكن أن تكون قيمة null
  );
}

  @override
  String toString() {
    return 'Skill(id: $id, userId: $userId, title: $title, body: $body, excerpt: $excerpt, startedAt: $startedAt, endedAt: $endedAt)';
  }

  @override
  bool operator ==(covariant Experience other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.title == title &&
      other.body == body &&
      other.excerpt == excerpt &&
      other.startedAt == startedAt &&
      other.endedAt == endedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      body.hashCode ^
      excerpt.hashCode ^
      startedAt.hashCode ^
      endedAt.hashCode;
  }
}
