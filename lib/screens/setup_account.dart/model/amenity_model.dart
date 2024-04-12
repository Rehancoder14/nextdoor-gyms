import 'dart:convert';

import 'package:nextdoorgym/helper/helper_model.dart';

class AmenitiesModel {
  Building? building;
  String? id;
  String? name;
  String? customId;
  int? count;
  String? description;

  AmenitiesModel({
    this.building,
    this.id,
    this.name,
    this.customId,
    this.count,
    this.description,
  });

  factory AmenitiesModel.fromRawJson(String str) =>
      AmenitiesModel.fromJson(json.decode(str));
  static final helper = HelperModel<AmenitiesModel>(
    AmenitiesModel.fromJson,
  );
  String toRawJson() => json.encode(toJson());

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        building: json["building"] == null
            ? null
            : Building.fromJson(json["building"]),
        id: json["_id"],
        name: json["name"],
        customId: json["customId"],
        count: json["count"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "building": building?.toJson(),
        "_id": id,
        "name": name,
        "customId": customId,
        "count": count,
        "description": description,
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
        'internalId': internalId,
        "name": name,
      };
}
