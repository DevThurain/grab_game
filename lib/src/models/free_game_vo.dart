class FreeGameVO {
  final String name;
  final String releaseYear;
  final String imageUrl;
  final Duration timeRemaining;
  final String isActive;

  FreeGameVO(
      {required this.name,
      required this.releaseYear,
      required this.imageUrl,
      required this.timeRemaining,
      required this.isActive});
}
