import 'audio_model.dart';

class BismillahModel {
  BismillahModel({
    required this.arab,
    required this.translation,
    required this.audio,
  });

  String arab;
  String translation;
  AudioModel audio;

  factory BismillahModel.fromJson(Map<String, dynamic> json) => BismillahModel(
        arab: json["arab"],
        translation: json["translation"],
        audio: AudioModel.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "translation": translation,
        "audio": audio.toJson(),
      };
}
