import 'dart:convert';
import 'package:nextdoorgym/helper/helper_model.dart';

class ScannedAmenityModel {
  User? user;
  Amenity? amenity;
  Building? building;
  String? id;
  String? returnTime;
  String? createdAt;
  String? updatedAt;
  int? v;

  ScannedAmenityModel({
    this.user,
    this.amenity,
    this.building,
    this.id,
    this.returnTime,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ScannedAmenityModel.fromRawJson(String str) =>
      ScannedAmenityModel.fromJson(json.decode(str));
  static final helper = HelperModel<ScannedAmenityModel>(
    ScannedAmenityModel.fromJson,
  );
  String toRawJson() => json.encode(toJson());

  factory ScannedAmenityModel.fromJson(Map<String, dynamic> json) =>
      ScannedAmenityModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        amenity:
            json["amenity"] == null ? null : Amenity.fromJson(json["amenity"]),
        building: json["building"] == null
            ? null
            : Building.fromJson(json["building"]),
        id: json["_id"],
        returnTime: json["returnTime"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "amenity": amenity?.toJson(),
        "building": building?.toJson(),
        "_id": id,
        "returnTime": returnTime,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Amenity {
  String? id;
  String? name;

  Amenity({
    this.id,
    this.name,
  });

  factory Amenity.fromRawJson(String str) => Amenity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Building {
  String? id;
  String? internalId;
  String? name;

  Building({
    this.id,
    this.internalId,
    this.name,
  });

  factory Building.fromRawJson(String str) =>
      Building.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["id"],
        internalId: json["internalId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "internalId": internalId,
        "name": name,
      };
}

class User {
  String? id;
  String? username;
  String? phone;

  User({
    this.id,
    this.username,
    this.phone,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phone": phone,
      };
}
