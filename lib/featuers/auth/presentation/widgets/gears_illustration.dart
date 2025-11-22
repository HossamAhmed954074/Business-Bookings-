import 'dart:math' as math;

import 'package:flutter/material.dart';

class GearsIllustration extends StatefulWidget {
  const GearsIllustration({super.key});

  @override
  State<GearsIllustration> createState() => _GearsIllustrationState();
}

class _GearsIllustrationState extends State<GearsIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            children: [
              // Background circle
              Positioned(
                left: 30,
                top: 20,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1DA1F2).withOpacity(0.1),
                  ),
                ),
              ),
              // Large Gear 1
              Positioned(
                left: 50,
                top: 40,
                child: Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: _buildGear(60, 8),
                ),
              ),
              // Medium Gear 2
              Positioned(
                left: 100,
                top: 20,
                child: Transform.rotate(
                  angle: -_controller.value * 2 * math.pi,
                  child: _buildGear(45, 6),
                ),
              ),
              // Small Gear 3
              Positioned(
                left: 30,
                top: 90,
                child: Transform.rotate(
                  angle: _controller.value * 2.5 * math.pi,
                  child: _buildGear(30, 5),
                ),
              ),
              // Medium Gear 4
              Positioned(
                right: 30,
                top: 70,
                child: Transform.rotate(
                  angle: -_controller.value * 1.8 * math.pi,
                  child: _buildGear(40, 6),
                ),
              ),
              // Small Gear 5
              Positioned(
                right: 50,
                bottom: 40,
                child: Transform.rotate(
                  angle: _controller.value * 2.2 * math.pi,
                  child: _buildGear(25, 4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGear(double size, int teeth) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1DA1F2).withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1DA1F2).withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer teeth
          ...List.generate(teeth, (index) {
            final angle = (index * 360 / teeth) * math.pi / 180;
            return Transform.rotate(
              angle: angle,
              child: Transform.translate(
                offset: Offset(0, -size / 2.5),
                child: Container(
                  width: size / 6,
                  height: size / 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1DA1F2).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            );
          }),
          // Inner circle
          Container(
            width: size / 3,
            height: size / 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: const Color(0xFF1DA1F2), width: 2),
            ),
          ),
        ],
      ),
    );
  }
}
