import 'package:flutter/material.dart';
import 'jokes.dart';

class FavoriteJokesScreen extends StatefulWidget {
  @override
  _FavoriteJokesScreenState createState() => _FavoriteJokesScreenState();
}

class _FavoriteJokesScreenState extends State<FavoriteJokesScreen> {
  int _favoritedJokeIndex = -1;

  void _toggleFavorite(int index) {
    setState(() {
      if (_favoritedJokeIndex == index) {
        // Unfavorite the joke
        _favoritedJokeIndex = -1;
        jokes[index].isFavorite = false;
      } else {
        // Favorite the selected joke
        _favoritedJokeIndex = index;
        jokes.forEach((joke) => joke.isFavorite = false); // Unfavorite all jokes
        jokes[index].isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Jokes'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          joke.title,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _toggleFavorite(index),
                        child: Icon(
                          joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: joke.isFavorite ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    joke.description,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
