class KemenagModel {
  KemenagModel({
    required this.short,
    required this.long,
  });

  String short;
  String long;

  factory KemenagModel.fromJson(Map<String, dynamic> json) => KemenagModel(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}
