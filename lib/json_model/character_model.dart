// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

List<CharacterModel> characterModelFromJson(String str) =>
    List<CharacterModel>.from(
        json.decode(str).map((x) => CharacterModel.fromJson(x)));

String characterModelToJson(List<CharacterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterModel {
  List<String>? empty;
  List<String>? characterModel;

  CharacterModel({
    this.empty,
    this.characterModel,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        empty: json["अ"] == null
            ? []
            : List<String>.from(json["अ"]!.map((x) => x)),
        characterModel: json["उ"] == null
            ? []
            : List<String>.from(json["उ"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "अ": empty == null ? [] : List<dynamic>.from(empty!.map((x) => x)),
        "उ": characterModel == null
            ? []
            : List<dynamic>.from(characterModel!.map((x) => x)),
      };
}
