// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobType {
  final num id;
  final String name;
  JobType({
    required this.id,
    required this.name,
  });
 

  JobType copyWith({
    num? id,
    String? name,
  }) {
    return JobType(
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

  factory JobType.fromMap(Map<String, dynamic> map) {
    return JobType(
      id: map['id'] as num,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobType.fromJson(String source) => JobType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JobType(id: $id, name: $name)';

  @override
  bool operator ==(covariant JobType other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
