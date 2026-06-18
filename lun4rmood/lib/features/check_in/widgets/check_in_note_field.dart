import 'package:flutter/material.dart';

class CheckInNoteField extends StatelessWidget {
  const CheckInNoteField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 3,
      maxLines: 5,
      maxLength: 220,
      style: const TextStyle(color: Color(0xFFF5F7FB)),
      decoration: InputDecoration(
        labelText: 'Note courte',
        hintText: 'Un mot, une sensation, une observation...',
        labelStyle: const TextStyle(color: Color(0xFFB8C6DD)),
        hintStyle: const TextStyle(color: Color(0xFF6F7F98)),
        counterStyle: const TextStyle(color: Color(0xFF6F7F98)),
        filled: true,
        fillColor: const Color(0xFF111B2E),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF24334F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF88AFFF)),
        ),
      ),
    );
  }
}
