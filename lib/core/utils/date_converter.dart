class DateConverter {
  const DateConverter._();

  static const List<String> _englishMonths = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  static const List<String> _englishWeekdays = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  static const List<String> _hijriMonths = [
    'Muharram', 'Safar', "Rabi' al-Awwal", "Rabi' ath-Thani",
    "Jumada al-Ula", "Jumada al-Akhirah", 'Rajab', "Sha'ban",
    'Ramadan', 'Shawwal', "Dhu al-Qadah", "Dhu al-Hijjah"
  ];

  static const List<String> _bengaliMonths = [
    'Boishakh', 'Joistho', 'Ashar', 'Shrabon', 'Bhadra', 'Ashwin',
    'Kartik', 'Agrahayan', 'Poush', 'Magh', 'Falgun', 'Choitro'
  ];

  static String formatEnglish(DateTime date) {
    final weekday = _englishWeekdays[date.weekday - 1];
    final month = _englishMonths[date.month - 1];
    return '$weekday, $month ${date.day}, ${date.year}';
  }

  static String formatHijri(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final baseDate = DateTime(2026, 6, 9);
    final diffDays = normalizedDate.difference(baseDate).inDays;

    int hDay = 23;
    int hMonth = 12; 
    int hYear = 1447;

    int getMonthLength(int month, int year) {
      if (month == 12) {
        final cycleYear = year % 30;
        final leapYears = [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29];
        return leapYears.contains(cycleYear) ? 30 : 29;
      }
      return month % 2 != 0 ? 30 : 29;
    }

    if (diffDays >= 0) {
      for (int i = 0; i < diffDays; i++) {
        hDay++;
        if (hDay > getMonthLength(hMonth, hYear)) {
          hDay = 1;
          hMonth++;
          if (hMonth > 12) {
            hMonth = 1;
            hYear++;
          }
        }
      }
    } else {
      final absDiff = diffDays.abs();
      for (int i = 0; i < absDiff; i++) {
        hDay--;
        if (hDay < 1) {
          hMonth--;
          if (hMonth < 1) {
            hMonth = 12;
            hYear--;
          }
          hDay = getMonthLength(hMonth, hYear);
        }
      }
    }

    final monthName = _hijriMonths[hMonth - 1];
    return '$hDay $monthName $hYear AH';
  }

  static String formatBengali(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final baseDate = DateTime(2026, 6, 9);
    final diffDays = normalizedDate.difference(baseDate).inDays;

    int bDay = 26;
    int bMonth = 2;
    int bYear = 1433;

    int getMonthLength(int month, int year) {
      if (month <= 6) return 31;
      if (month == 11) {
        final gregYear = year + 593;
        final isLeap = (gregYear % 4 == 0 && gregYear % 100 != 0) || (gregYear % 400 == 0);
        return isLeap ? 31 : 30;
      }
      return 30;
    }

    if (diffDays >= 0) {
      for (int i = 0; i < diffDays; i++) {
        bDay++;
        if (bDay > getMonthLength(bMonth, bYear)) {
          bDay = 1;
          bMonth++;
          if (bMonth > 12) {
            bMonth = 1;
            bYear++;
          }
        }
      }
    } else {
      final absDiff = diffDays.abs();
      for (int i = 0; i < absDiff; i++) {
        bDay--;
        if (bDay < 1) {
          bMonth--;
          if (bMonth < 1) {
            bMonth = 12;
            bYear--;
          }
          bDay = getMonthLength(bMonth, bYear);
        }
      }
    }

    final monthName = _bengaliMonths[bMonth - 1];
    return '$bDay $monthName $bYear BS';
  }
}
