// To parse this JSON data, do
//
//     final quranModel = quranModelFromJson(jsonString);

import 'dart:convert';
import 'ayah_model.dart';
import 'bismillah_model.dart';

List<QuranModel> quranModelFromJson(String str) =>
    List<QuranModel>.from(json.decode(str).map((x) => QuranModel.fromJson(x)));

String quranModelToJson(List<QuranModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuranModel {
  QuranModel({
    required this.number,
    required this.numberOfAyahs,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.description,
    required this.audio,
    required this.bismillah,
    required this.ayahs,
  });

  int number;
  int numberOfAyahs;
  String name;
  String translation;
  String revelation;
  String description;
  String audio;
  BismillahModel bismillah;
  List<AyahModel> ayahs;

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        name: json["name"],
        translation: json["translation"],
        revelation: json["revelation"],
        description: json["description"],
        audio: json["audio"],
        bismillah: BismillahModel.fromJson(json["bismillah"]),
        ayahs: List<AyahModel>.from(
            json["ayahs"].map((x) => AyahModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "name": name,
        "translation": translation,
        "revelation": revelation,
        "description": description,
        "audio": audio,
        "bismillah": bismillah.toJson(),
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
      };
}
