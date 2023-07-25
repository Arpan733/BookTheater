class EventModel {
  final String title;
  final String description;
  final String bannerUrl;
  final String date;

  const EventModel({
    required this.title,
    required this.description,
    required this.bannerUrl,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          bannerUrl == other.bannerUrl &&
          date == other.date);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      bannerUrl.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'EventModel{' +
        ' title: $title,' +
        ' description: $description,' +
        ' bannerUrl: $bannerUrl,' +
        ' date: $date,' +
        '}';
  }

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

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('title'): this.title,
      keyMapper('description'): this.description,
      keyMapper('bannerUrl'): this.bannerUrl,
      keyMapper('date'): this.date,
    };
  }

  factory EventModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return EventModel(
      title: map[keyMapper('title')] as String,
      description: map[keyMapper('description')] as String,
      bannerUrl: map[keyMapper('bannerUrl')] as String,
      date: map[keyMapper('date')] as String,
    );
  }
}
