import 'package:flutter/material.dart';
import 'package:que_comer_hoy/theme/theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      backgroundColor: beigeColor,
      body: const Center(child: Text('Search Screen')),
    );
  }
}
