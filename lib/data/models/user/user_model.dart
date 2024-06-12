class UserModel {
  final int pk;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  UserModel({
    required this.pk,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      pk: json['pk'] as int? ?? 0,
      username: json['username'] as String? ?? "",
      email: json['email'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'pk': pk,
      'username': username,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  // Method to create a copy of the UserModel with modified values
  UserModel copyWith({
    int? pk,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      pk: pk ?? this.pk,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
