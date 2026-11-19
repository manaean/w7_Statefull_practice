// EX 2 – The best cards (handout page: EX 2). Start code for Part 1.
// Try Part 1 yourself first, then compare with ex2_part1_correction.dart.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  IconData get icon => _isFavorite ? Icons.favorite : Icons.favorite_border;

  Color get iconColor => _isFavorite ? Colors.red : Colors.grey;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("title", style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
                Text("description"),
              ],
            ),
          ),
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(icon, color: iconColor),
          ),
        ],
      ),
      // YOUR CODE
    );
  }
}
