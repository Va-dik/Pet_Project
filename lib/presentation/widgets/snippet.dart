import 'package:flutter/material.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class Snippet extends StatelessWidget {
  const Snippet({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const ShapeDecoration(
        color: Color(0xFFFBFBFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: CustomText(
        text,
        fontWeight: FontWeight.w600,
        color: const Color.fromRGBO(130, 135, 150, 1),
      ),
    );
  }
}
