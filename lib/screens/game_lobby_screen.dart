import 'package:flutter/material.dart';
import '../models/game.dart';

class GameLobbyScreen extends StatefulWidget {
  final GameModel game;

  const GameLobbyScreen({super.key, required this.game});

  @override
  State<GameLobbyScreen> createState() => _GameLobbyScreenState();
}

class _GameLobbyScreenState extends State<GameLobbyScreen> {
  late GameModel game;
  bool joined = false;

  final List<String> mockPlayers = [
    'Алина', 'Марк', 'Игорь', 'Светлана', 'Тимур', 'Оля', 'Денис', 'Катя',
  ];

  @override
  void initState() {
    super.initState();
    game = widget.game;
  }

  void toggleJoin() {
    setState(() {
      if (joined) {
        game = game.copyWith(playersJoined: game.playersJoined - 1);
        joined = false;
      } else if (!game.isFull) {
        game = game.copyWith(playersJoined: game.playersJoined + 1);
        joined = true;
        if (game.isFull) {
          game = game.copyWith(status: 'Полный состав');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final players = mockPlayers.take(game.playersJoined).toList();

    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(game.type)),
            const SizedBox(height: 12),
            Text(
              '${game.playersJoined} / ${game.playersMax} игроков (минимум ${game.playersMin})',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: game.playersJoined / game.playersMax),
            const SizedBox(height: 16),
            Text('Игроки в лобби', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(players[index]),
                  );
                },
              ),
            ),
            FilledButton(
              onPressed: game.isFull && !joined ? null : toggleJoin,
              child: Text(joined ? 'Покинуть лобби' : 'Присоединиться'),
            ),
          ],
        ),
      ),
    );
  }
}
