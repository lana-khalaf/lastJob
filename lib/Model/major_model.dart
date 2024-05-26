// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Major {
  num id;
  String name;
  Null specializations;
  Major({
    required this.id,
    required this.name,
    required this.specializations,
  });

  Major copyWith({
    num? id,
    String? name,
    Null? specializations,
  }) {
    return Major(
      id: id ?? this.id,
      name: name ?? this.name,
      specializations: specializations ?? this.specializations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'specializations': specializations,
    };
  }

  factory Major.fromMap(Map<String, dynamic> map) {
    return Major(
      id: map['id'] as num,
      name: map['name'] as String,
      specializations: map['specializations'] as Null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Major.fromJson(String source) => Major.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Major(id: $id, name: $name, specializations: $specializations)';

  @override
  bool operator ==(covariant Major other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.specializations == specializations;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ specializations.hashCode;
}
