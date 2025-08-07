import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, Routes.createEvent),
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}
