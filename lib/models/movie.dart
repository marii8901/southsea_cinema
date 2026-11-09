class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.imagePath,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String synopsis = json['synopsis'] as String;
    final String ageRating = json['ageRating'] as String;
    final String screeningTime = json['screeningTime'] as String;
    final num priceNumber = json['price'] as num;
    final double price = priceNumber.toDouble();
    final String imagePath = json['imagePath'] as String;

    return Movie(
      id: id,
      title: title,
      synopsis: synopsis,
      ageRating: ageRating,
      screeningTime: screeningTime,
      price: price,
      imagePath: imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'screeningTime': screeningTime,
      'price': price,
      'imagePath': imagePath,
    };
  }
}
