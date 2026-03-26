import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassRenderer extends StatelessWidget {
  final Widget? child;

  const LiquidGlassRenderer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          alignment: Alignment.center, // 👈 centers content automatically
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: child, // 👈 THIS is the missing piece
        ),
      ),
    );
  }
}

