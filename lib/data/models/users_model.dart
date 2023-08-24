class UsersModel {
  // "id": 1,
  // "username": "John",
  // "name": "John Smith",
  // "state": "California",
  // "avatar_url": "https

  final int id;
  final String username;
  final String name;
  final String state;
  final String avatar_url;

  UsersModel(
      {required this.id,
      required this.username,
      required this.name,
      required this.state,
      required this.avatar_url});

  UsersModel copyWith(
          {int? id,
          String? username,
          String? name,
          String? state,
          String? avatar_url}) =>
      UsersModel(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        state: state ?? this.state,
        avatar_url: avatar_url ?? this.avatar_url,
      );

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        id: json['id'] as int? ?? 0,
        username: json['username'] as String? ?? "",
        name: json['name'] as String? ?? "",
        state: json['state'] as String? ?? "",
        avatar_url: json['avatar_url'] as String? ?? "");
  }

  @override
  String toString() => '''
    id: $id,
    username: $username,
    name: $name,
    state: $state,
    avatar_url: $avatar_url
     ''';
}
