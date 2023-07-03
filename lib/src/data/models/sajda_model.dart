class SajdaModel {
  SajdaModel({
    required this.recommended,
    required this.obligatory,
  });

  bool recommended;
  bool obligatory;

  factory SajdaModel.fromJson(Map<String, dynamic> json) => SajdaModel(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}
