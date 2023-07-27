import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheaterModel {
  final String id;
  final String name;
  final LatLng coordinates;
  final List<String> facilities;
  final String fullAddress;
  final List<String> timings;
  final List<String> screens;

  const TheaterModel({
    required this.id,
    required this.name,
    this.coordinates = const LatLng(23.1029063, 72.593212),
    this.facilities = const [
      "Cancel",
      "Parking",
      "Hotel",
      "Park",
    ],
    this.fullAddress =
        "4d Square Mall, opp. Vishwakarma Engineering College, Motera, Ahmedabad, Gujarat 380005",
    this.timings = const ["10:00 AM", "1:30 PM", "6:00 PM", "9:30 PM"],
    this.screens = const ["2D", "3D"],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TheaterModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          coordinates == other.coordinates &&
          facilities == other.facilities &&
          fullAddress == other.fullAddress &&
          timings == other.timings &&
          screens == other.screens);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      coordinates.hashCode ^
      facilities.hashCode ^
      fullAddress.hashCode ^
      timings.hashCode ^
      screens.hashCode;

  @override
  String toString() {
    return 'TheaterModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' coordinates: $coordinates,' +
        ' facilities: $facilities,' +
        ' fullAddress: $fullAddress,' +
        ' timings: $timings,' +
        ' screens: $screens,' +
        '}';
  }

  TheaterModel copyWith({
    String? id,
    String? name,
    LatLng? coordinates,
    List<String>? facilities,
    String? fullAddress,
    List<String>? timings,
    List<String>? screens,
  }) {
    return TheaterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
      facilities: facilities ?? this.facilities,
      fullAddress: fullAddress ?? this.fullAddress,
      timings: timings ?? this.timings,
      screens: screens ?? this.screens,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): this.id,
      keyMapper('name'): this.name,
      keyMapper('coordinates'): this.coordinates,
      keyMapper('facilities'): this.facilities,
      keyMapper('fullAddress'): this.fullAddress,
      keyMapper('timings'): this.timings,
      keyMapper('screens'): this.screens,
    };
  }

  factory TheaterModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return TheaterModel(
      id: map[keyMapper('id')] as String,
      name: map[keyMapper('name')] as String,
      coordinates: map[keyMapper('coordinates')] as LatLng,
      facilities: map[keyMapper('facilities')] as List<String>,
      fullAddress: map[keyMapper('fullAddress')] as String,
      timings: map[keyMapper('timings')] as List<String>,
      screens: map[keyMapper('screens')] as List<String>,
    );
  }
}
