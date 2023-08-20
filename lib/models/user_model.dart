class UserModel {
  final String userName;
  final int userAge;

  UserModel({this.userName = "", this.userAge = 0});

  UserModel copyWith({String? userName, int? userAge}) => UserModel(
      userName: userName ?? this.userName, userAge: userAge ?? this.userAge);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] as String? ?? "",
      userAge: json['userAge'] as int? ?? 0,
    );
  }

  @override
  String toString() =>
    '''
    userName: $userName,
    userAge: $userAge
    ''';

}
