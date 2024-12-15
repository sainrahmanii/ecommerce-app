import 'package:flutter/material.dart';

class SpaceHeight extends StatelessWidget {
  const SpaceHeight({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class SpaceWidth extends StatelessWidget {
  const SpaceWidth({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}
