import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 420,
          left: 100,
          child: SvgPicture.asset(
            'assets/svg_images/Subtract-1.svg',
            width: 20,
          ),
        ),

        Positioned(
          bottom: 490,
          right: 100,
          child: SvgPicture.asset('assets/svg_images/Subtract.svg', width: 20),
        ),
        Center(child: Image.asset('assets/png_images/ShouT.png')),
      ],
    );
  }
}
