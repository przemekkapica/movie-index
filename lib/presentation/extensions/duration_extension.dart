extension DurationExtension on Duration {
  String get formatHHmm {
    String padDigit(int n) => n.toString().padLeft(1, '0');

    final twoDigitMinutes = padDigit(inMinutes.remainder(60).abs());

    return '${padDigit(inHours)} h $twoDigitMinutes m';
  }
}
