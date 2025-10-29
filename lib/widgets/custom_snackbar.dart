import 'package:flutter/material.dart';
import 'package:que_comer_hoy/theme/theme.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: sandYellow,
      content: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: darkText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
