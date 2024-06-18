// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class CommunityModel {
//    num id;
//   String name;
//   dynamic blogs;
//   dynamic userCommunities;
//   CommunityModel({
//     required this.id,
//     required this.name,
//     required this.blogs,
//     required this.userCommunities,
//   });

//   CommunityModel copyWith({
//     num? id,
//     String? name,
//     dynamic? blogs,
//     dynamic? userCommunities,
//   }) {
//     return CommunityModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       blogs: blogs ?? this.blogs,
//       userCommunities: userCommunities ?? this.userCommunities,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'blogs': blogs,
//       'userCommunities': userCommunities,
//     };
//   }

//   factory CommunityModel.fromMap(Map<String, dynamic> map) {
//     return CommunityModel(
//       id: map['id'] as num,
//       name: map['name'] as String,
//       blogs: map['blogs'] as dynamic,
//       userCommunities: map['userCommunities'] as dynamic,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CommunityModel.fromJson(String source) => CommunityModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'CommunityModel(id: $id, name: $name, blogs: $blogs, userCommunities: $userCommunities)';
//   }

//   @override
//   bool operator ==(covariant CommunityModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.id == id &&
//       other.name == name &&
//       other.blogs == blogs &&
//       other.userCommunities == userCommunities;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       name.hashCode ^
//       blogs.hashCode ^
//       userCommunities.hashCode;
//   }
// }
import 'dart:convert';

class CommunityModel {
  num id;
  String name;
  dynamic blogs;
  dynamic userCommunities;

  CommunityModel({
    required this.id,
    required this.name,
    required this.blogs,
    required this.userCommunities,
  });

  CommunityModel copyWith({
    num? id,
    String? name,
    dynamic? blogs,
    dynamic? userCommunities,
  }) {
    return CommunityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      blogs: blogs ?? this.blogs,
      userCommunities: userCommunities ?? this.userCommunities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'blogs': blogs,
      'userCommunities': userCommunities,
    };
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      id: map['id'] as num,
      name: map['name'] as String,
      blogs: map['blogs'],
      userCommunities: map['userCommunities'],
    );
  }

  String toJson() => json.encode(toMap());

  // تحديث هذه الدالة لقبول Map بدلاً من String
  factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel.fromMap(json);

  @override
  String toString() {
    return 'CommunityModel(id: $id, name: $name, blogs: $blogs, userCommunities: $userCommunities)';
  }

  @override
  bool operator ==(covariant CommunityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.blogs == blogs &&
      other.userCommunities == userCommunities;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      blogs.hashCode ^
      userCommunities.hashCode;
  }
}

