class User {
  final String email;
  final String username;
  final String type;
  final String phone;
  final double? latitude;
  final double? longitude;
  final String social;
  final String? address;

  User({
    required this.email,
    required this.username,
    required this.type,
    required this.phone,
    this.latitude,
    this.longitude,
    required this.social,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      username: json['username'],
      type: json['type'],
      phone: json['phone'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      social: json['social'],
      address: json['address'],
    );
  }
}
