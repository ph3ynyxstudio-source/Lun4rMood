import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class CrystaPh3yOverlay extends StatefulWidget {
  const CrystaPh3yOverlay({super.key, this.onModelLoaded});

  final VoidCallback? onModelLoaded;   // ← AJOUT 1 : nouvelle propriété

  @override
  State<CrystaPh3yOverlay> createState() => _CrystaPh3yOverlayState();
}

class _CrystaPh3yOverlayState extends State<CrystaPh3yOverlay> {
  late Flutter3DController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Flutter3DController();
  }

  void _onModelLoaded(String address) {
    _controller.playAnimation(animationName: 'ArmatureAction');
    widget.onModelLoaded?.call();   // ← AJOUT 2 : déclenche le callback
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: SizedBox(
            width: 150,
            height: 150,
            child: AbsorbPointer(
              child: Flutter3DViewer(
                src: 'assets/crystaph3y.glb',
                controller: _controller,
                onLoad: _onModelLoaded,
              ),
            ),
          ),
        ),
      ],
    );
  }
}