import 'detail_ayah_model.dart';

class DetailSurahModel {
  num? id;
  String? name;
  String? translation;
  String? revelation;
  num? numberOfAyahs;
  List<DetailAyahModel>? ayahs;

  DetailSurahModel({
    this.id,
    this.name,
    this.translation,
    this.revelation,
    this.numberOfAyahs,
    this.ayahs,
  });

  @override
  String toString() {
    return 'DetailSurahModel(id: $id, name: $name, translation: $translation, revelation: $revelation, numberOfAyahs: $numberOfAyahs, ayahs: $ayahs)';
  }

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) {
    return DetailSurahModel(
      id: num.tryParse(json['id'].toString()),
      name: json['name']?.toString(),
      translation: json['translation']?.toString(),
      revelation: json['revelation']?.toString(),
      numberOfAyahs: num.tryParse(json['numberOfAyahs'].toString()),
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => DetailAyahModel.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}
