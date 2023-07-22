class PlayModel {
  final String title;
  final String description;
  final String bannerUrl;
  final String date;

  PlayModel({
    required this.title,
    required this.description,
    required this.bannerUrl,
    required this.date,
  });

  PlayModel copyWith({
    String? title,
    String? description,
    String? bannerUrl,
    String? date,
  }) {
    return PlayModel(
      title: title ?? this.title,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      date: date ?? this.date,
    );
  }
}