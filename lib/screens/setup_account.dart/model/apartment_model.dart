import 'dart:convert';

import 'package:nextdoorgym/helper/helper_model.dart';

class ApartmentModel {
  String? id;
  String? name;
  String? internalId;
  List<ApartmentBlock>? apartmentBlocks;
  String? contact;

  ApartmentModel({
    this.id,
    this.name,
    this.internalId,
    this.apartmentBlocks,
    this.contact,
  });

  factory ApartmentModel.fromRawJson(String str) =>
      ApartmentModel.fromJson(json.decode(str));
  static final helper = HelperModel<ApartmentModel>(
    ApartmentModel.fromJson,
  );
  String toRawJson() => json.encode(toJson());

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        id: json["_id"],
        name: json["name"],
        internalId: json["internalId"],
        apartmentBlocks: json["apartmentBlocks"] == null
            ? []
            : List<ApartmentBlock>.from(json["apartmentBlocks"]!
                .map((x) => ApartmentBlock.fromJson(x))),
        contact: json["contact"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "internalId": internalId,
        "apartmentBlocks": apartmentBlocks == null
            ? []
            : List<dynamic>.from(apartmentBlocks!.map((x) => x.toJson())),
        "contact": contact,
      };
}

class ApartmentBlock {
  String? blockName;
  int? noOfPeople;
  String? id;

  ApartmentBlock({
    this.blockName,
    this.noOfPeople,
    this.id,
  });

  factory ApartmentBlock.fromRawJson(String str) =>
      ApartmentBlock.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApartmentBlock.fromJson(Map<String, dynamic> json) => ApartmentBlock(
        blockName: json["blockName"],
        noOfPeople: json["noOfPeople"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "blockName": blockName,
        "noOfPeople": noOfPeople,
        "_id": id,
      };
}
