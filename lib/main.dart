import 'package:flutter/material.dart';
import 'widgets/main_scaffold.dart';

void main() {
  runApp(const ZoviApp());
}

class ZoviApp extends StatelessWidget {
  const ZoviApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zovi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFFF5A5F),
        brightness: Brightness.light,
      ),
      home: const MainScaffold(),
    );
  }
}
