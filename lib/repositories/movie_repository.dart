import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'howl',
        title: 'Howls Moving Castle',
        synopsis: 'A young milliner is turned into an elderly woman by a vengeful witch and enters a magical castle.',
        ageRating: 'PG',
        screeningTime: 'Sunday 4 Oct 2026 15:00',
        price: 7.50,
        imagePath: 'assets/images/howl.jpg',
      ),
      Movie(
        id: 'spirited',
        title: 'Spirited Away',
        synopsis: 'During her familys move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods and spirits.',
        ageRating: 'PG',
        screeningTime: 'Thursday 8 Oct 2026 18:00',
        price: 7.50,
        imagePath: 'assets/images/spirited.jpg',
      ),
    ];
  }
}