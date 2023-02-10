import 'kemenag_model.dart';

class TafsirModel {
  TafsirModel({
    required this.kemenag,
    required this.quraish,
    required this.jalalayn,
  });

  KemenagModel kemenag;
  String quraish;
  String jalalayn;

  factory TafsirModel.fromJson(Map<String, dynamic> json) => TafsirModel(
        kemenag: KemenagModel.fromJson(json["kemenag"]),
        quraish: json["quraish"],
        jalalayn: json["jalalayn"],
      );

  Map<String, dynamic> toJson() => {
        "kemenag": kemenag.toJson(),
        "quraish": quraish,
        "jalalayn": jalalayn,
      };
}
