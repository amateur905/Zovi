import 'package:flutter/material.dart';
import '../models/event.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFull = event.spotsLeft <= 0;
    final dateLabel =
        '${event.dateTime.day.toString().padLeft(2, '0')}.${event.dateTime.month.toString().padLeft(2, '0')} в ${event.dateTime.hour.toString().padLeft(2, '0')}:${event.dateTime.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Chip(label: Text(event.category)),
                  const Spacer(),
                  Text(dateLabel, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 8),
              Text(event.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(event.location, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 18,
                    color: isFull ? Colors.red : Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isFull
                        ? 'Мест нет'
                        : '${event.spotsLeft} мест свободно',
                    style: TextStyle(color: isFull ? Colors.red : Colors.green),
                  ),
                  const Spacer(),
                  Text('Организатор: ${event.hostName}',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
