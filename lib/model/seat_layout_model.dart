class SeatLayoutModel {
  final int rows;
  final int cols;
  final List<Map<String, dynamic>> seatTypes;
  final int theaterId;
  final int gap;
  final int gapColIndex;
  final bool isLastFilled;
  final List<int> rowBreaks;

  const SeatLayoutModel({
    required this.rows,
    required this.cols,
    required this.seatTypes,
    required this.theaterId,
    required this.gap,
    required this.gapColIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeatLayoutModel &&
          runtimeType == other.runtimeType &&
          rows == other.rows &&
          cols == other.cols &&
          seatTypes == other.seatTypes &&
          theaterId == other.theaterId &&
          gap == other.gap &&
          gapColIndex == other.gapColIndex &&
          isLastFilled == other.isLastFilled &&
          rowBreaks == other.rowBreaks);

  @override
  int get hashCode =>
      rows.hashCode ^
      cols.hashCode ^
      seatTypes.hashCode ^
      theaterId.hashCode ^
      gap.hashCode ^
      gapColIndex.hashCode ^
      isLastFilled.hashCode ^
      rowBreaks.hashCode;

  @override
  String toString() {
    return 'SeatLayoutModel{' +
        ' rows: $rows,' +
        ' cols: $cols,' +
        ' seatTypes: $seatTypes,' +
        ' theaterId: $theaterId,' +
        ' gap: $gap,' +
        ' gapColIndex: $gapColIndex,' +
        ' isLastFilled: $isLastFilled,' +
        ' rowBreaks: $rowBreaks,' +
        '}';
  }

  SeatLayoutModel copyWith({
    int? rows,
    int? cols,
    List<Map<String, dynamic>>? seatTypes,
    int? theaterId,
    int? gap,
    int? gapColIndex,
    bool? isLastFilled,
    List<int>? rowBreaks,
  }) {
    return SeatLayoutModel(
      rows: rows ?? this.rows,
      cols: cols ?? this.cols,
      seatTypes: seatTypes ?? this.seatTypes,
      theaterId: theaterId ?? this.theaterId,
      gap: gap ?? this.gap,
      gapColIndex: gapColIndex ?? this.gapColIndex,
      isLastFilled: isLastFilled ?? this.isLastFilled,
      rowBreaks: rowBreaks ?? this.rowBreaks,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('rows'): this.rows,
      keyMapper('cols'): this.cols,
      keyMapper('seatTypes'): this.seatTypes,
      keyMapper('theaterId'): this.theaterId,
      keyMapper('gap'): this.gap,
      keyMapper('gapColIndex'): this.gapColIndex,
      keyMapper('isLastFilled'): this.isLastFilled,
      keyMapper('rowBreaks'): this.rowBreaks,
    };
  }

  factory SeatLayoutModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return SeatLayoutModel(
      rows: map[keyMapper('rows')] as int,
      cols: map[keyMapper('cols')] as int,
      seatTypes: map[keyMapper('seatTypes')] as List<Map<String, dynamic>>,
      theaterId: map[keyMapper('theaterId')] as int,
      gap: map[keyMapper('gap')] as int,
      gapColIndex: map[keyMapper('gapColIndex')] as int,
      isLastFilled: map[keyMapper('isLastFilled')] as bool,
      rowBreaks: map[keyMapper('rowBreaks')] as List<int>,
    );
  }
}
