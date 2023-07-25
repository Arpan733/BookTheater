import 'dart:ui';

import 'package:booktheater/utils/mytheme.dart';

class OfferModel {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime expiry;
  final double discount;
  final Color color;
  final List<Color> gradientColor;

  const OfferModel({
    required this.title,
    required this.description,
    required this.startTime,
    required this.expiry,
    required this.discount,
    this.color = Mytheme.redTextColor,
    this.gradientColor = Mytheme.redGiftGradientColors,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfferModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          startTime == other.startTime &&
          expiry == other.expiry &&
          discount == other.discount &&
          color == other.color &&
          gradientColor == other.gradientColor);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      startTime.hashCode ^
      expiry.hashCode ^
      discount.hashCode ^
      color.hashCode ^
      gradientColor.hashCode;

  @override
  String toString() {
    return 'OfferModel{' +
        ' title: $title,' +
        ' description: $description,' +
        ' startTime: $startTime,' +
        ' expiry: $expiry,' +
        ' discount: $discount,' +
        ' color: $color,' +
        ' gradientColor: $gradientColor,' +
        '}';
  }

  OfferModel copyWith({
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? expiry,
    double? discount,
    Color? color,
    List<Color>? gradientColor,
  }) {
    return OfferModel(
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      expiry: expiry ?? this.expiry,
      discount: discount ?? this.discount,
      color: color ?? this.color,
      gradientColor: gradientColor ?? this.gradientColor,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('title'): this.title,
      keyMapper('description'): this.description,
      keyMapper('startTime'): this.startTime,
      keyMapper('expiry'): this.expiry,
      keyMapper('discount'): this.discount,
      keyMapper('color'): this.color,
      keyMapper('gradientColor'): this.gradientColor,
    };
  }

  factory OfferModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return OfferModel(
      title: map[keyMapper('title')] as String,
      description: map[keyMapper('description')] as String,
      startTime: map[keyMapper('startTime')] as DateTime,
      expiry: map[keyMapper('expiry')] as DateTime,
      discount: map[keyMapper('discount')] as double,
      color: map[keyMapper('color')] as Color,
      gradientColor: map[keyMapper('gradientColor')] as List<Color>,
    );
  }
}
