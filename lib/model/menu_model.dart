class MenuModel {
  String name;
  String image;

  MenuModel({
    required this.name,
    required this.image,
  });

  MenuModel copyWith({
    String? name,
    String? image,
  }) {
    return MenuModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}