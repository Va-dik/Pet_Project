import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/assets_icons.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/pages/hotel_page/hotel_page.dart';
import 'package:hotels/presentation/widgets/custom_app_bar.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/action_button.dart';

class PaySuccessPage extends StatelessWidget {
  const PaySuccessPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(title: StringConstants.paidOrder),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.18,
          ),
          Image.asset(
            AssetsIcons.fireworksIcon,
            scale: 5,
          ),
          const SizedBox(height: 32),
          const CustomText(
            StringConstants.orderProcessed,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: -1,
          ),
          const SizedBox(height: 20),
          const CustomText(
            StringConstants.orderConfirm,
            textAlign: TextAlign.center,
            fontSize: 15,
            color: Color.fromRGBO(130, 135, 150, 1),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      bottomNavigationBar: ActionButton(
        textButton: StringConstants.superButton,
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            'hotelPage',
            (route) => false),
        isBottom: true,
      ),
    );
  }
}
