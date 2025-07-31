class ColorLevel {
  final String name;
  final String hex;

  ColorLevel({required this.name, required this.hex});

  factory ColorLevel.fromJson(Map<String, dynamic> json) {
    return ColorLevel(
      name: json['name'],
      hex: json['hex'],
    );
  }
}
