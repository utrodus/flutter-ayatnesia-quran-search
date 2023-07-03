class ImageModel {
  ImageModel({
    required this.primary,
    required this.secondary,
  });

  String primary;
  String secondary;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        primary: json["primary"],
        secondary: json["secondary"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
      };
}
