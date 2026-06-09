class PrayerTime {
  final String name;
  final String time;
  final String startTime;
  final String endTime;
  final bool isNext;

  const PrayerTime({
    required this.name,
    required this.time,
    required this.startTime,
    required this.endTime,
    this.isNext = false,
  });

  PrayerTime copyWith({
    String? name,
    String? time,
    String? startTime,
    String? endTime,
    bool? isNext,
  }) {
    return PrayerTime(
      name: name ?? this.name,
      time: time ?? this.time,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isNext: isNext ?? this.isNext,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrayerTime &&
        other.name == name &&
        other.time == time &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isNext == isNext;
  }

  @override
  int get hashCode => Object.hash(name, time, startTime, endTime, isNext);
}
