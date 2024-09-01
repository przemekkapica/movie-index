extension DurationExtension on Duration {
  String get formatHHmm {
    String twoDigits(int n) => n.toString().padLeft(1, '0');

    final twoDigitMinutes = twoDigits(inMinutes.remainder(60).abs());

    return '${twoDigits(inHours)} h $twoDigitMinutes m';
  }
}
