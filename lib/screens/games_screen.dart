import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/game_card.dart';
import 'game_lobby_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Игры')),
      body: ListView.builder(
        itemCount: MockData.games.length,
        itemBuilder: (context, index) {
          final game = MockData.games[index];
          return GameCard(
            game: game,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => GameLobbyScreen(game: game),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
