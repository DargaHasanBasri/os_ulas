import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final String? id;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isVerified;
  final DateTime? refreshTokenExpiry;
  final DateTime? verificationEmailSentAt;

  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.isVerified,
    this.refreshTokenExpiry,
    this.verificationEmailSentAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    createdAt,
    updatedAt,
    isVerified,
    refreshTokenExpiry,
    verificationEmailSentAt,
  ];

  User copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isVerified,
    DateTime? refreshTokenExpiry,
    DateTime? verificationEmailSentAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerified: isVerified ?? this.isVerified,
      refreshTokenExpiry: refreshTokenExpiry ?? this.refreshTokenExpiry,
      verificationEmailSentAt:
          verificationEmailSentAt ?? this.verificationEmailSentAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_verified': isVerified,
      'refresh_token_expiry': refreshTokenExpiry,
      'verification_email_sent_at': verificationEmailSentAt,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      isVerified: json['is_verified'] as bool?,
      refreshTokenExpiry: json['refresh_token_expiry'] != null
          ? DateTime.parse(json['refresh_token_expiry'] as String)
          : null,
      verificationEmailSentAt: json['verification_email_sent_at'] != null
          ? DateTime.parse(json['verification_email_sent_at'] as String)
          : null,
    );
  }
}
