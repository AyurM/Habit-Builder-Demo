import 'dart:convert';

class SignUpData {
  final String username;
  final String email;
  final String password;
  final bool keepSignedIn;
  final bool receiveEmails;

  const SignUpData({
    required this.username,
    required this.email,
    required this.password,
    required this.keepSignedIn,
    required this.receiveEmails,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'keepSignedIn': keepSignedIn,
      'receiveEmails': receiveEmails,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SignUpData(username: $username, email: $email, password: $password, keepSignedIn: $keepSignedIn, receiveEmails: $receiveEmails)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpData &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.keepSignedIn == keepSignedIn &&
        other.receiveEmails == receiveEmails;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        keepSignedIn.hashCode ^
        receiveEmails.hashCode;
  }
}
