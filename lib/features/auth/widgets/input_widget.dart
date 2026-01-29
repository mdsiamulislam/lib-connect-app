import  'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const InputWidget({
    super.key,
    required this.isDark,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: isDark ? Colors.black : Colors.white,
            filled: true,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}