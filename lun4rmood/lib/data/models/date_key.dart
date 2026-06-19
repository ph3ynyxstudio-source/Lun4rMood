class DateKey {
  const DateKey._();

  static DateTime normalize(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String encode(DateTime date) {
    final normalized = normalize(date);
    final month = normalized.month.toString().padLeft(2, '0');
    final day = normalized.day.toString().padLeft(2, '0');
    return '${normalized.year.toString().padLeft(4, '0')}-$month-$day';
  }

  static DateTime decode(String value) {
    final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
    if (match == null) {
      throw FormatException('Invalid date key: $value');
    }

    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final day = int.parse(match.group(3)!);
    final date = DateTime(year, month, day);

    if (date.year != year || date.month != month || date.day != day) {
      throw FormatException('Invalid calendar date: $value');
    }
    return date;
  }
}
