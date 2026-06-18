import 'package:flutter/material.dart';

import 'widgets/check_in_note_field.dart';
import 'widgets/check_in_slider.dart';
import 'widgets/save_check_in_button.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final TextEditingController _noteController = TextEditingController();

  double _mood = 6;
  double _energy = 5;
  double _stress = 4;
  double _craving = 3;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _showStoragePendingMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Check-in pret a etre connecte au stockage local.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07101D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _CheckInHeader(),
              const SizedBox(height: 28),
              _CheckInCard(
                child: Column(
                  children: [
                    CheckInSlider(
                      label: 'Humeur',
                      value: _mood,
                      onChanged: (value) => setState(() => _mood = value),
                    ),
                    const SizedBox(height: 14),
                    CheckInSlider(
                      label: 'Energie',
                      value: _energy,
                      onChanged: (value) => setState(() => _energy = value),
                    ),
                    const SizedBox(height: 14),
                    CheckInSlider(
                      label: 'Stress',
                      value: _stress,
                      onChanged: (value) => setState(() => _stress = value),
                    ),
                    const SizedBox(height: 14),
                    CheckInSlider(
                      label: 'Envie ou consommation',
                      value: _craving,
                      onChanged: (value) => setState(() => _craving = value),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              _CheckInCard(
                child: CheckInNoteField(controller: _noteController),
              ),
              const SizedBox(height: 22),
              SaveCheckInButton(onPressed: _showStoragePendingMessage),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckInHeader extends StatelessWidget {
  const _CheckInHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lun△rMood',
          style: TextStyle(
            color: Color(0xFF9DB8E8),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Check-in du jour',
          style: TextStyle(
            color: Color(0xFFF5F7FB),
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Prends un moment pour observer ton etat actuel.',
          style: TextStyle(
            color: Color(0xFFB8C6DD),
            fontSize: 16,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

class _CheckInCard extends StatelessWidget {
  const _CheckInCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1728),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF1D2B44)),
      ),
      child: child,
    );
  }
}
