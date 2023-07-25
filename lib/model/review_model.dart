class ReviewModel {
  final String userId;
  final DateTime reviewDate;
  final String description;

  const ReviewModel({
    required this.userId,
    required this.reviewDate,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          reviewDate == other.reviewDate &&
          description == other.description);

  @override
  int get hashCode =>
      userId.hashCode ^ reviewDate.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'ReviewModel{' +
        ' userId: $userId,' +
        ' reviewDate: $reviewDate,' +
        ' description: $description,' +
        '}';
  }

  ReviewModel copyWith({
    String? userId,
    DateTime? reviewDate,
    String? description,
  }) {
    return ReviewModel(
      userId: userId ?? this.userId,
      reviewDate: reviewDate ?? this.reviewDate,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('userId'): this.userId,
      keyMapper('reviewDate'): this.reviewDate,
      keyMapper('description'): this.description,
    };
  }

  factory ReviewModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return ReviewModel(
      userId: map[keyMapper('userId')] as String,
      reviewDate: map[keyMapper('reviewDate')] as DateTime,
      description: map[keyMapper('description')] as String,
    );
  }
}
