// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommunityUserBlog {
   final num id;
  final String name;
  CommunityUserBlog({
    required this.id,
    required this.name,
  });


  CommunityUserBlog copyWith({
    num? id,
    String? name,
  }) {
    return CommunityUserBlog(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CommunityUserBlog.fromMap(Map<String, dynamic> map) {
    return CommunityUserBlog(
      id: map['id'] as num,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityUserBlog.fromJson(String source) => CommunityUserBlog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CommunityUserBlog(id: $id, name: $name)';

  @override
  bool operator ==(covariant CommunityUserBlog other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
