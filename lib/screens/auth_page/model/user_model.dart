import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? userId;
  String? phone;
  bool? isAccountSetup;
  String? createdAt;
  String? updatedAt;
  String? token;

  UserModel({
    this.id,
    this.userId,
    this.phone,
    this.isAccountSetup,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userId: json["userId"],
        phone: json["phone"],
        isAccountSetup: json["isAccountSetup"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "phone": phone,
        "isAccountSetup": isAccountSetup,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "token": token,
      };
}
