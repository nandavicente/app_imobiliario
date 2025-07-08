import 'package:flutter/material.dart';

class MenuImageButton extends StatefulWidget {
  final String image;
  final VoidCallback onTap;

  const MenuImageButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  State<MenuImageButton> createState() => _MenuImageButtonState();
}

class _MenuImageButtonState extends State<MenuImageButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth < 350
        ? screenWidth * 0.9
        : screenWidth < 600
            ? screenWidth * 0.45
            : screenWidth < 1000
                ? screenWidth * 0.30
                : screenWidth * 0.22;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            widget.image,
            width: imageWidth,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
