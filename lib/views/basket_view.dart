import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    final cart = BasketRepository.instance;
    final items = cart.getItems();

    late Widget content;

    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your basket is empty.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              _confirmationMessage,
              style: const TextStyle(
                color: cinemaBrand,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      } else {
        content = const Center(
          child: Text(
            'Your basket is empty.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      }
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY ORDER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final movie = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      '1 Ticket',
                      style: TextStyle(
                        color: cinemaBrand,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      '${movie.title}\n${movie.screeningTime}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      movie.formattedPrice,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: cinemaBrand),
                    onPressed: () {
                      setState(() {
                        cart.removeItem(index);
                      });
                    },
                  ),
                ],
              ),
            );
          }),
          const Divider(color: Colors.white24),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Due',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '£${cart.getTotalDue().toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: cinemaBrand),
                  onPressed: () => setState(() {}),
                  child: const Text('UPDATE ORDER', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: cinemaBrand),
                  onPressed: () {
                    setState(() {
                      cart.clear();
                      _confirmationMessage = 'Thank you for your order!';
                    });
                  },
                  child: const Text('BUY TICKETS', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}