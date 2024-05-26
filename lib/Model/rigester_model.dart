// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  String FirstName;
  String LastName;
  String Email;
  String Password;
  String ConfirmPassword;
  RegisterModel({
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Password,
    required this.ConfirmPassword,
  });

  RegisterModel copyWith({
    String? FirstName,
    String? LastName,
    String? Email,
    String? Password,
    String? ConfirmPassword,
  }) {
    return RegisterModel(
      FirstName: FirstName ?? this.FirstName,
      LastName: LastName ?? this.LastName,
      Email: Email ?? this.Email,
      Password: Password ?? this.Password,
      ConfirmPassword: ConfirmPassword ?? this.ConfirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FirstName': FirstName,
      'LastName': LastName,
      'Email': Email,
      'Password': Password,
      'ConfirmPassword': ConfirmPassword,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      FirstName: map['FirstName'] as String,
      LastName: map['LastName'] as String,
      Email: map['Email'] as String,
      Password: map['Password'] as String,
      ConfirmPassword: map['ConfirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(FirstName: $FirstName, LastName: $LastName, Email: $Email, Password: $Password, ConfirmPassword: $ConfirmPassword)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.FirstName == FirstName &&
      other.LastName == LastName &&
      other.Email == Email &&
      other.Password == Password &&
      other.ConfirmPassword == ConfirmPassword;
  }

  @override
  int get hashCode {
    return FirstName.hashCode ^
      LastName.hashCode ^
      Email.hashCode ^
      Password.hashCode ^
      ConfirmPassword.hashCode;
  }
}
