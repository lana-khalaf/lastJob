// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final num id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final num? birthYear;
  final String picture;
  final String bio;
  final num rating;
   final num rings;
   final num wallet;
  final num? hourPrice;
  final String? country;
  final String? city;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    this.birthYear,
    required this.picture,
    required this.bio,
    required this.rating,
    required this.rings,
    required this.wallet,
    this.hourPrice,
    this.country,
    this.city,
  });
 

  User copyWith({
    num? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    num? birthYear,
    String? picture,
    String? bio,
    num? rating,
    num? rings,
    num? wallet,
    num? hourPrice,
    String? country,
    String? city,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthYear: birthYear ?? this.birthYear,
      picture: picture ?? this.picture,
      bio: bio ?? this.bio,
      rating: rating ?? this.rating,
      rings: rings ?? this.rings,
      wallet: wallet ?? this.wallet,
      hourPrice: hourPrice ?? this.hourPrice,
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthYear': birthYear,
      'picture': picture,
      'bio': bio,
      'rating': rating,
      'rings': rings,
      'wallet': wallet,
      'hourPrice': hourPrice,
      'country': country,
      'city': city,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as num,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      birthYear: map['birthYear'] != null ? map['birthYear'] as num : null,
      picture: map['picture'] as String,
      bio: map['bio'] as String,
      rating: map['rating'] as num,
      rings: map['rings'] as num,
      wallet: map['wallet'] as num,
      hourPrice: map['hourPrice'] != null ? map['hourPrice'] as num : null,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phoneNumber: $phoneNumber, birthYear: $birthYear, picture: $picture, bio: $bio, rating: $rating, rings: $rings, wallet: $wallet, hourPrice: $hourPrice, country: $country, city: $city)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.username == username &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.birthYear == birthYear &&
      other.picture == picture &&
      other.bio == bio &&
      other.rating == rating &&
      other.rings == rings &&
      other.wallet == wallet &&
      other.hourPrice == hourPrice &&
      other.country == country &&
      other.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      birthYear.hashCode ^
      picture.hashCode ^
      bio.hashCode ^
      rating.hashCode ^
      rings.hashCode ^
      wallet.hashCode ^
      hourPrice.hashCode ^
      country.hashCode ^
      city.hashCode;
  }
}
