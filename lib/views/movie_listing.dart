import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Column(
        children: [
          Container(
            color: cinemaSurface,
            child: Column(
              children: [
                Text('Spider-Man Across the Spider-Verse (2023) (PG)'),
                Text('Southsea Cinema Room'),
                Text('Thursday 22 Oct 2026, 18:00'),
              ],
            ),
          ),
          const Text('Select Quantities'),
          Row(
            children: const [
              Text('Tickets: '),
            ],
          ),
        ],
      ),
    );
  }
}
