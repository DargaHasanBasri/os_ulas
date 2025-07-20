extension StringShortenExtension on String {
  String get shortenId {
    if (length <= 16) return this;
    return "${substring(0, 16)}...";
  }
}
