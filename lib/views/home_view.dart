import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movie> _movies = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // 1. Start the asynchronous loading method from initState
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final repository = MovieRepository();
      // 2. Await the asset loader inside this method (not inside initState)
      final loadedMovies = await repository.loadMoviesFromAsset();

      // 3. Check mounted before calling setState on success
      if (!mounted) return;
      setState(() {
        _movies = loadedMovies;
        _isLoading = false;
      });
    } catch (e) {
      // 4. Handle errors and check mounted before updating state
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Failed to load movies catalogue.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      // 5. Show loading indicator, error message, or the movie list dynamically
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: _movies[index]);
                  },
                ),
    );
  }
}
