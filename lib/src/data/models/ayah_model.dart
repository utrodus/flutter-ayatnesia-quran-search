import 'audio_model.dart';
import 'image_model.dart';
import 'meta_model.dart';
import 'number_model.dart';
import 'tafsir_model.dart';

class AyahModel {
  AyahModel({
    required this.number,
    required this.arab,
    required this.translation,
    required this.audio,
    required this.image,
    required this.tafsir,
    required this.meta,
  });

  NumberModel number;
  String arab;
  String translation;
  AudioModel audio;
  ImageModel image;
  TafsirModel tafsir;
  MetaModel meta;

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
        number: NumberModel.fromJson(json["number"]),
        arab: json["arab"],
        translation: json["translation"],
        audio: AudioModel.fromJson(json["audio"]),
        image: ImageModel.fromJson(json["image"]),
        tafsir: TafsirModel.fromJson(json["tafsir"]),
        meta: MetaModel.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number.toJson(),
        "arab": arab,
        "translation": translation,
        "audio": audio.toJson(),
        "image": image.toJson(),
        "tafsir": tafsir.toJson(),
        "meta": meta.toJson(),
      };
}
