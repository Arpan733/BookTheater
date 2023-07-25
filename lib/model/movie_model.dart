class MovieModel {
  final String title;
  final String description;
  final List<String> actors;
  final int like;
  final String bannerUrl;

  const MovieModel({
    required this.title,
    required this.description,
    required this.actors,
    required this.like,
    required this.bannerUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          actors == other.actors &&
          like == other.like &&
          bannerUrl == other.bannerUrl);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      actors.hashCode ^
      like.hashCode ^
      bannerUrl.hashCode;

  @override
  String toString() {
    return 'MovieModel{' +
        ' title: $title,' +
        ' description: $description,' +
        ' actors: $actors,' +
        ' like: $like,' +
        ' bannerUrl: $bannerUrl,' +
        '}';
  }

  MovieModel copyWith({
    String? title,
    String? description,
    List<String>? actors,
    int? like,
    String? bannerUrl,
  }) {
    return MovieModel(
      title: title ?? this.title,
      description: description ?? this.description,
      actors: actors ?? this.actors,
      like: like ?? this.like,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('title'): this.title,
      keyMapper('description'): this.description,
      keyMapper('actors'): this.actors,
      keyMapper('like'): this.like,
      keyMapper('bannerUrl'): this.bannerUrl,
    };
  }

  factory MovieModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return MovieModel(
      title: map[keyMapper('title')] as String,
      description: map[keyMapper('description')] as String,
      actors: map[keyMapper('actors')] as List<String>,
      like: map[keyMapper('like')] as int,
      bannerUrl: map[keyMapper('bannerUrl')] as String,
    );
  }
}
