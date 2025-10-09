import 'package:flutter/material.dart';
import 'package:que_comer_hoy/theme/theme.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plan')),
      backgroundColor: beigeColor,
      body: const Center(child: Text('Plan Screen')),
    );
  }
}
