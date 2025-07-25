class UserModel {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      email: json['data']['user']['email'],
      image: json['data']['user']['image'],
      token: json['data']['token'],
    );
  }
}
