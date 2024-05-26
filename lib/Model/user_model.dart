// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String Id;
  String Username;
  String Email;
  String verificationCode;
  UserModel({
    required this.Id,
    required this.Username,
    required this.Email,
    required this.verificationCode,
  });

  UserModel copyWith({
    String? Id,
    String? Username,
    String? Email,
    String? verificationCode,
  }) {
    return UserModel(
      Id: Id ?? this.Id,
      Username: Username ?? this.Username,
      Email: Email ?? this.Email,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': Id,
      'Username': Username,
      'Email': Email,
      'verificationCode': verificationCode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      Id: map['Id'] as String,
      Username: map['Username'] as String,
      Email: map['Email'] as String,
      verificationCode: map['verificationCode'] as String ,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(Id: $Id, Username: $Username, Email: $Email, verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.Id == Id &&
      other.Username == Username &&
      other.Email == Email &&
      other.verificationCode == verificationCode;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
      Username.hashCode ^
      Email.hashCode ^
      verificationCode.hashCode;
  }
}
