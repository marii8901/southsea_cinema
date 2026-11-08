import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String _bookingMessage = ''; // stores ticket choice
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: cinemaSurface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.movie.title} (${widget.movie.ageRating})',
                  style: cinemaHeaderStyle,
                ),
                Text(
                  widget.movie.screeningTime,
                  style: const TextStyle(color: cinemaFontMuted),
                ),
                Text('Thursday 22 Oct 2026, 18:00',
                    style: TextStyle(color: cinemaFontMuted)),
              ],
            ),
          ),
          const Text('Select Quantities'),
          Row(
            children: [
              DropdownMenu<int>(
                initialSelection: 0,
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _ticketQuantity = value;
                    });
                  }
                },
                dropdownMenuEntries: const [
                  // list
                  DropdownMenuEntry(value: 0, label: '0'),
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              const SizedBox(width: 12),
              const Text('Adult (£7.50)'),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              label: 'Add to Booking',
              onPressed: () {
                if (_ticketQuantity > 0) {
                  for (int i = 0; i < _ticketQuantity; i++) {
                    BasketRepository.instance.addItem(widget.movie);
                  }
                  Navigator.pushNamed(context, '/basket');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}