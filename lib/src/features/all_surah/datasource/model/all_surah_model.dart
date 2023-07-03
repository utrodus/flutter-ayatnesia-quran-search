class AllSurahModel {
  num? id;
  String? name;
  String? translation;
  String? revelation;
  num? numberOfAyahs;

  AllSurahModel({
    this.id,
    this.name,
    this.translation,
    this.revelation,
    this.numberOfAyahs,
  });

  @override
  String toString() {
    return 'AllSurahModel(id: $id, name: $name, translation: $translation, revelation: $revelation, numberOfAyahs: $numberOfAyahs)';
  }

  factory AllSurahModel.fromJson(Map<String, dynamic> json) => AllSurahModel(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        translation: json['translation']?.toString(),
        revelation: json['revelation']?.toString(),
        numberOfAyahs: num.tryParse(json['numberOfAyahs'].toString()),
      );
}
