import 'sajda_model.dart';

class MetaModel {
  MetaModel({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  int juz;
  int page;
  int manzil;
  int ruku;
  int hizbQuarter;
  SajdaModel sajda;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: SajdaModel.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda.toJson(),
      };
}
