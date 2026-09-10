import 'package:flutter/material.dart';
import '../models/event.dart';
import 'chat_screen.dart';

class EventDetailScreen extends StatefulWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late EventModel event;
  bool joined = false;

  @override
  void initState() {
    super.initState();
    event = widget.event;
  }

  void toggleJoin() {
    setState(() {
      if (joined) {
        event = event.copyWith(spotsTaken: event.spotsTaken - 1);
        joined = false;
      } else if (event.spotsLeft > 0) {
        event = event.copyWith(spotsTaken: event.spotsTaken + 1);
        joined = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFull = event.spotsLeft <= 0 && !joined;
    final dateLabel =
        '${event.dateTime.day.toString().padLeft(2, '0')}.${event.dateTime.month.toString().padLeft(2, '0')} в ${event.dateTime.hour.toString().padLeft(2, '0')}:${event.dateTime.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(event.category)),
            const SizedBox(height: 12),
            Text(event.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 6),
                Text(dateLabel),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18),
                const SizedBox(width: 6),
                Text(event.location),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 18),
                const SizedBox(width: 6),
                Text('Организатор: ${event.hostName}'),
              ],
            ),
            const SizedBox(height: 16),
            Text(event.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(
              '${event.spotsTaken} из ${event.spotsTotal} мест занято',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: isFull ? null : toggleJoin,
                    child: Text(joined ? 'Отменить участие' : 'Присоединиться'),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(title: event.title),
                      ),
                    );
                  },
                  child: const Text('Чат'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
