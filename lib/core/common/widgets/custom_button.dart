import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets_path.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonIcon,
    required this.buttonOnTap,
  });

  final String buttonText;
  final String? buttonIcon;
  final void Function() buttonOnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOnTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [SvgPicture.asset( height: 52, width: 331, AssetsPath.customRectangleButton)],
          ),

          Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ),

          if (buttonIcon != null)
            Positioned(
              right: 50,
              top: 10,
              child: SvgPicture.asset(height: 24, width: 24, buttonIcon!),
            ),
        ],
      ),
    );
  }
}
