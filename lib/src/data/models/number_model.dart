class NumberModel {
  NumberModel({
    required this.inQuran,
    required this.inSurah,
  });

  int inQuran;
  int inSurah;

  factory NumberModel.fromJson(Map<String, dynamic> json) => NumberModel(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}
