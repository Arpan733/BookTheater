class EventModel {
  final String title;
  final String description;
  final String bannerUrl;
  final String date;

  EventModel({
    required this.title,
    required this.description,
    required this.bannerUrl,
    required this.date,
  });

  EventModel copyWith({
    String? title,
    String? description,
    String? bannerUrl,
    String? date,
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      date: date ?? this.date,
    );
  }
}