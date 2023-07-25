class CrewCastModel {
  final String movieId;
  final String castId;
  final String name;
  final String image;

//<editor-fold desc="Data Methods">
  const CrewCastModel({
    required this.movieId,
    required this.castId,
    required this.name,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrewCastModel &&
          runtimeType == other.runtimeType &&
          movieId == other.movieId &&
          castId == other.castId &&
          name == other.name &&
          image == other.image);

  @override
  int get hashCode =>
      movieId.hashCode ^ castId.hashCode ^ name.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'CrewCastModel{' +
        ' movieId: $movieId,' +
        ' castId: $castId,' +
        ' name: $name,' +
        ' image: $image,' +
        '}';
  }

  CrewCastModel copyWith({
    String? movieId,
    String? castId,
    String? name,
    String? image,
  }) {
    return CrewCastModel(
      movieId: movieId ?? this.movieId,
      castId: castId ?? this.castId,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('movieId'): this.movieId,
      keyMapper('castId'): this.castId,
      keyMapper('name'): this.name,
      keyMapper('image'): this.image,
    };
  }

  factory CrewCastModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return CrewCastModel(
      movieId: map[keyMapper('movieId')] as String,
      castId: map[keyMapper('castId')] as String,
      name: map[keyMapper('name')] as String,
      image: map[keyMapper('image')] as String,
    );
  }

//</editor-fold>
}
