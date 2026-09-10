import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  String category = 'Спорт';
  int spots = 10;

  final categories = const ['Спорт', 'Настолки', 'Йога', 'Кроссфит', 'Другое'];

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void submit() {
    if (titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название события')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Событие создано (демо, без сохранения)')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новое событие')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Название',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: category,
            decoration: const InputDecoration(
              labelText: 'Категория',
              border: OutlineInputBorder(),
            ),
            items: categories
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (value) {
              setState(() {
                category = value ?? category;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Место проведения',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Описание',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Text('Количество мест: $spots'),
          Slider(
            value: spots.toDouble(),
            min: 2,
            max: 30,
            divisions: 28,
            label: '$spots',
            onChanged: (value) {
              setState(() {
                spots = value.round();
              });
            },
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: submit,
            child: const Text('Создать событие'),
          ),
        ],
      ),
    );
  }
}
