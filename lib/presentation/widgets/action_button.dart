import 'package:flutter/material.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.textButton,
      this.isBottom = false,
      this.onPressed});
  final String textButton;
  final bool? isBottom;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.10;
    return Container(
      decoration: isBottom == true
          ? const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(232, 233, 236, 1),
                ),
              ),
            )
          : const BoxDecoration(color: Colors.white),
      height: isBottom == true ? height : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: isBottom == true
                ? const EdgeInsets.only(left: 16, right: 16, bottom: 20)
                : const EdgeInsets.all(0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(13, 114, 255, 1),
                minimumSize: Size(double.infinity, height * 0.55),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: CustomText(
                textButton,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
