import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BouncingText extends StatefulWidget {
  final String text;
  const BouncingText({super.key, required this.text});

  @override
  State<BouncingText> createState() => _BouncingTextState();
}

class _BouncingTextState extends State<BouncingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Speed of bounce
    )..repeat(reverse: true); // Makes it bounce continuously

    _animation = Tween<double>(begin: 0, end: 4.h).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value), // Moves text up and down
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        );
      },
    );
  }
}
