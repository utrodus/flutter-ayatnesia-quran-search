class VerseModel {
  num? surahId;
  String? suratName;
  num? similarity;
  num? similarityPercentage;
  String? arabic;
  String? translation;
  num? numberInQuran;
  num? numberInSurah;
  String? tafsir;

  VerseModel({
    this.surahId,
    this.suratName,
    this.similarity,
    this.similarityPercentage,
    this.arabic,
    this.translation,
    this.numberInQuran,
    this.numberInSurah,
    this.tafsir,
  });

  @override
  String toString() {
    return 'Result(surahId: $surahId, suratName: $suratName, similarity: $similarity, similarityPercentage: $similarityPercentage, arabic: $arabic, translation: $translation, numberInQuran: $numberInQuran, numberInSurah: $numberInSurah, tafsir: $tafsir)';
  }

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        surahId: num.tryParse(json['surah_id'].toString()),
        suratName: json['surat_name']?.toString(),
        similarity: num.tryParse(json['similarity'].toString()),
        similarityPercentage:
            num.tryParse(json['similarity_percentage'].toString()),
        arabic: json['arabic']?.toString(),
        translation: json['translation']?.toString(),
        numberInQuran: num.tryParse(json['numberInQuran'].toString()),
        numberInSurah: num.tryParse(json['numberInSurah'].toString()),
        tafsir: json['tafsir']?.toString(),
      );
}
