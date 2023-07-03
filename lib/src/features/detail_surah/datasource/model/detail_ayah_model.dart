class DetailAyahModel {
  num? id;
  num? surahId;
  num? numberInQuran;
  num? numberInSurah;
  String? arabic;
  String? translation;
  String? tafsir;

  DetailAyahModel({
    this.id,
    this.surahId,
    this.numberInQuran,
    this.numberInSurah,
    this.arabic,
    this.translation,
    this.tafsir,
  });

  @override
  String toString() {
    return 'Ayah(id: $id, surahId: $surahId, numberInQuran: $numberInQuran, numberInSurah: $numberInSurah, arabic: $arabic, translation: $translation, tafsir: $tafsir)';
  }

  factory DetailAyahModel.fromJson(Map<String, dynamic> json) =>
      DetailAyahModel(
        id: num.tryParse(json['id'].toString()),
        surahId: num.tryParse(json['surah_id'].toString()),
        numberInQuran: num.tryParse(json['number_in_quran'].toString()),
        numberInSurah: num.tryParse(json['number_in_surah'].toString()),
        arabic: json['arabic']?.toString(),
        translation: json['translation']?.toString(),
        tafsir: json['tafsir']?.toString(),
      );
}
