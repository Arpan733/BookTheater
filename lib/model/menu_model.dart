class MenuModel {
  String name;
  String image;

  MenuModel({
    required this.name,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image);

  @override
  int get hashCode => name.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'MenuModel{' + ' name: $name,' + ' image: $image,' + '}';
  }

  MenuModel copyWith({
    String? name,
    String? image,
  }) {
    return MenuModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('name'): this.name,
      keyMapper('image'): this.image,
    };
  }

  factory MenuModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return MenuModel(
      name: map[keyMapper('name')] as String,
      image: map[keyMapper('image')] as String,
    );
  }
}
