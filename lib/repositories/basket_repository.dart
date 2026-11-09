import 'package:southsea_cinema/models/movie.dart';

class BasketRepository {
  BasketRepository._internal();

  static final BasketRepository instance = BasketRepository._internal();

  final List<Movie> _items = [];

  List<Movie> getItems() {
    return List<Movie>.unmodifiable(_items);
  }

  void addItem(Movie item) {
    _items.add(item);
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  int getTotalItems() {
    return _items.length;
  }

  int get totalItemCount {
    return getTotalItems();
  }

  double getSubtotal() {
    double sum = 0.0;
    for (final Movie item in _items) {
      sum += item.price;
    }
    return sum;
  }

  double getTotalDue() {
    return getSubtotal();
  }

  void clear() {
    _items.clear();
  }
}
