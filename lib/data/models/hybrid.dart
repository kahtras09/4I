enum HybridState {
  idle,
  engineOutput,
  regenerativeBreaking,
  baterryOutput,
}

enum ArrowState { blue, red, green, yellow }

enum BatteryState { white, red, green, yellow, orange }

class Hybrid {
  final HybridState hybridState;
  final ArrowState topArrowState;
  final ArrowState leftArrowState;
  final ArrowState rightArrowState;
  final BatteryState batteryState;
  Hybrid({
    required this.hybridState,
    required this.topArrowState,
    required this.leftArrowState,
    required this.rightArrowState,
    required this.batteryState,
  });

  const Hybrid.initial()
      : hybridState = HybridState.idle,
        topArrowState = ArrowState.blue,
        leftArrowState = ArrowState.blue,
        rightArrowState = ArrowState.blue,
        batteryState = BatteryState.white;

  Hybrid copyWith({
    HybridState? hybridState,
    ArrowState? topArrowState,
    ArrowState? leftArrowState,
    ArrowState? rightArrowState,
    BatteryState? batteryState,
  }) {
    return Hybrid(
      hybridState: hybridState ?? this.hybridState,
      topArrowState: topArrowState ?? this.topArrowState,
      leftArrowState: leftArrowState ?? this.leftArrowState,
      rightArrowState: rightArrowState ?? this.rightArrowState,
      batteryState: batteryState ?? this.batteryState,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'hybridState': hybridState.toMap(),
  //     'topArrowState': topArrowState.toMap(),
  //     'leftArrowState': leftArrowState.toMap(),
  //     'rightArrowState': rightArrowState.toMap(),
  //     'batteryState': batteryState.toMap(),
  //   };
  // }

  // factory Hybrid.fromMap(Map<String, dynamic> map) {
  //   return Hybrid(
  //     hybridState: HybridState.fromMap(map['hybridState']),
  //     topArrowState: ArrowState.fromMap(map['topArrowState']),
  //     leftArrowState: ArrowState.fromMap(map['leftArrowState']),
  //     rightArrowState: ArrowState.fromMap(map['rightArrowState']),
  //     batteryState: BatteryState.fromMap(map['batteryState']),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Hybrid.fromJson(String source) => Hybrid.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hybrid(hybridState: $hybridState, topArrowState: $topArrowState, leftArrowState: $leftArrowState, rightArrowState: $rightArrowState, batteryState: $batteryState)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hybrid &&
        other.hybridState == hybridState &&
        other.topArrowState == topArrowState &&
        other.leftArrowState == leftArrowState &&
        other.rightArrowState == rightArrowState &&
        other.batteryState == batteryState;
  }

  @override
  int get hashCode {
    return hybridState.hashCode ^
        topArrowState.hashCode ^
        leftArrowState.hashCode ^
        rightArrowState.hashCode ^
        batteryState.hashCode;
  }
}
