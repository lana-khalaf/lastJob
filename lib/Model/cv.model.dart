// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CV {
  final num id;
  final num ownerId;
  final String file;
  final String createdAt;
  CV({
    required this.id,
    required this.ownerId,
    required this.file,
    required this.createdAt,
  });
 

  CV copyWith({
    num? id,
    num? ownerId,
    String? file,
    String? createdAt,
  }) {
    return CV(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      file: file ?? this.file,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ownerId': ownerId,
      'file': file,
      'createdAt': createdAt,
    };
  }

  factory CV.fromMap(Map<String, dynamic> map) {
    return CV(
      id: map['id'] as num,
      ownerId: map['ownerId'] as num,
      file: map['file'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CV.fromJson(String source) => CV.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CV(id: $id, ownerId: $ownerId, file: $file, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant CV other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.ownerId == ownerId &&
      other.file == file &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      ownerId.hashCode ^
      file.hashCode ^
      createdAt.hashCode;
  }
}
