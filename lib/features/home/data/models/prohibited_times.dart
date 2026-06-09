import 'package:adhan/adhan.dart';

class ProhibitedTimes {
  final String sunriseStart;
  final String sunriseEnd;
  final String zawalStart;
  final String zawalEnd;
  final String sunsetStart;
  final String sunsetEnd;

  const ProhibitedTimes({
    required this.sunriseStart,
    required this.sunriseEnd,
    required this.zawalStart,
    required this.zawalEnd,
    required this.sunsetStart,
    required this.sunsetEnd,
  });

  static const Map<String, ({double lat, double lng})> _coords = {
    'Barishal':   (lat: 22.7010, lng: 90.3535),
    'Chattogram': (lat: 22.3569, lng: 91.7832),
    'Dhaka':      (lat: 23.8103, lng: 90.4125),
    'Khulna':     (lat: 22.8456, lng: 89.5403),
    'Mymensingh': (lat: 24.7471, lng: 90.4203),
    'Rajshahi':   (lat: 24.3745, lng: 88.6042),
    'Rangpur':    (lat: 25.7439, lng: 89.2752),
    'Sylhet':     (lat: 24.8949, lng: 91.8687),
  };

  static const _defaultCoord = (lat: 23.8103, lng: 90.4125);

  factory ProhibitedTimes.calculate(DateTime date, String division) {
    final c = _coords[division] ?? _defaultCoord;
    final coordinates = Coordinates(c.lat, c.lng);
    final params = CalculationMethod.karachi.getParameters()
      ..madhab = Madhab.hanafi;
    final dc = DateComponents(date.year, date.month, date.day);
    final pt = PrayerTimes(coordinates, dc, params);

    final sunriseStart = pt.sunrise;
    final sunriseEnd   = sunriseStart.add(const Duration(minutes: 15));

    final dhuhr      = pt.dhuhr;
    final zawalStart = dhuhr.subtract(const Duration(minutes: 10));

    final maghrib    = pt.maghrib;
    final sunsetStart = maghrib.subtract(const Duration(minutes: 15));

    String fmt(DateTime? dt) {
      if (dt == null) return '--:--';
      final h = dt.hour;
      final m = dt.minute;
      final period = h >= 12 ? 'PM' : 'AM';
      final h12 = h == 0 ? 12 : (h > 12 ? h - 12 : h);
      final mm = m.toString().padLeft(2, '0');
      return '$h12:$mm $period';
    }

    return ProhibitedTimes(
      sunriseStart: fmt(sunriseStart),
      sunriseEnd:   fmt(sunriseEnd),
      zawalStart:   fmt(zawalStart),
      zawalEnd:     fmt(dhuhr),
      sunsetStart:  fmt(sunsetStart),
      sunsetEnd:    fmt(maghrib),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProhibitedTimes &&
        other.sunriseStart == sunriseStart &&
        other.sunriseEnd == sunriseEnd &&
        other.zawalStart == zawalStart &&
        other.zawalEnd == zawalEnd &&
        other.sunsetStart == sunsetStart &&
        other.sunsetEnd == sunsetEnd;
  }

  @override
  int get hashCode => Object.hash(
        sunriseStart, sunriseEnd, zawalStart, zawalEnd, sunsetStart, sunsetEnd);
}

