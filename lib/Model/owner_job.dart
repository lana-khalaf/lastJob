// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Owner {
      final String name;
  final String username;
  final String email;
  final String? country;
  final String? city;
  final String? bio;
  final String? picture;
  final num rating;
  final num? employeesRangeUp;
  final num? employeesRangeDown;
  final String? major;
  Owner({
    required this.name,
    required this.username,
    required this.email,
    this.country,
    this.city,
    this.bio,
    this.picture,
    required this.rating,
    this.employeesRangeUp,
    this.employeesRangeDown,
    this.major,
  });
  

  Owner copyWith({
    String? name,
    String? username,
    String? email,
    String? country,
    String? city,
    String? bio,
    String? picture,
    num? rating,
    num? employeesRangeUp,
    num? employeesRangeDown,
    String? major,
  }) {
    return Owner(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      country: country ?? this.country,
      city: city ?? this.city,
      bio: bio ?? this.bio,
      picture: picture ?? this.picture,
      rating: rating ?? this.rating,
      employeesRangeUp: employeesRangeUp ?? this.employeesRangeUp,
      employeesRangeDown: employeesRangeDown ?? this.employeesRangeDown,
      major: major ?? this.major,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'email': email,
      'country': country,
      'city': city,
      'bio': bio,
      'picture': picture,
      'rating': rating,
      'employeesRangeUp': employeesRangeUp,
      'employeesRangeDown': employeesRangeDown,
      'major': major,
    };
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      rating: map['rating'] as num,
      employeesRangeUp: map['employeesRangeUp'] != null ? map['employeesRangeUp'] as num : null,
      employeesRangeDown: map['employeesRangeDown'] != null ? map['employeesRangeDown'] as num : null,
      major: map['major'] != null ? map['major'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Owner.fromJson(String source) => Owner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Owner(name: $name, username: $username, email: $email, country: $country, city: $city, bio: $bio, picture: $picture, rating: $rating, employeesRangeUp: $employeesRangeUp, employeesRangeDown: $employeesRangeDown, major: $major)';
  }

  @override
  bool operator ==(covariant Owner other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.username == username &&
      other.email == email &&
      other.country == country &&
      other.city == city &&
      other.bio == bio &&
      other.picture == picture &&
      other.rating == rating &&
      other.employeesRangeUp == employeesRangeUp &&
      other.employeesRangeDown == employeesRangeDown &&
      other.major == major;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      country.hashCode ^
      city.hashCode ^
      bio.hashCode ^
      picture.hashCode ^
      rating.hashCode ^
      employeesRangeUp.hashCode ^
      employeesRangeDown.hashCode ^
      major.hashCode;
  }
}
