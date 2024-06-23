class Owner {
  final String username;
  final String email;
  final String? phone;
  final String? social;
  final String? address;
  final String? picture;
  final String? type;

  Owner({
    required this.username,
    required this.email,
    this.phone,
    this.social,
    this.address,
    this.picture,
    this.type,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    print(json);
    return Owner(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      social: json['social'],
      address: json['address'],
      picture: json['picture'],
      type: json['type'],
    );
  }
}
