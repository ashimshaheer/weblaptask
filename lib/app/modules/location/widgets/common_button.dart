import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/extentions.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  const CommonButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Responsive.width * 70,
        height: Responsive.height * 7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A1A1A), // Start color (#1A1A1A)
              Color(0xFF343434), // End color (#343434)
            ],
            begin: Alignment.centerLeft, // Start from the left
            end: Alignment.centerRight, // End at the right
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x1A0A0E0F), // Shadow color with alpha (#0A0E0F1A in ARGB format)
              offset: Offset(0, 1), // Horizontal (x) and vertical (y) offsets
              blurRadius: 6, // Blur radius
            ),
          ],
        ),
        child: Center(
          child: CommonTextWidget(
            color: const Color(0xffFFFFFF),
            text: text ?? "Request Wyber",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 21,
          ),
        ),
      ),
    );
  }
}
