class AudioModel {
  AudioModel({
    required this.alafasy,
    required this.ahmedajamy,
    required this.husarymujawwad,
    required this.minshawi,
    required this.muhammadayyoub,
    required this.muhammadjibreel,
  });

  String alafasy;
  String ahmedajamy;
  String husarymujawwad;
  String minshawi;
  String muhammadayyoub;
  String muhammadjibreel;

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        alafasy: json["alafasy"],
        ahmedajamy: json["ahmedajamy"],
        husarymujawwad: json["husarymujawwad"],
        minshawi: json["minshawi"],
        muhammadayyoub: json["muhammadayyoub"],
        muhammadjibreel: json["muhammadjibreel"],
      );

  Map<String, dynamic> toJson() => {
        "alafasy": alafasy,
        "ahmedajamy": ahmedajamy,
        "husarymujawwad": husarymujawwad,
        "minshawi": minshawi,
        "muhammadayyoub": muhammadayyoub,
        "muhammadjibreel": muhammadjibreel,
      };
}
