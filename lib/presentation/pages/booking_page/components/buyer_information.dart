import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/widgets/base_container.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/custom_text_field.dart';

class BuyerInformation extends StatelessWidget {
  BuyerInformation({super.key});

  TextEditingController phoneNumberController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const CustomText(
            StringConstants.buyerInformation,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            type: TextInputType.phone,
            labelText: StringConstants.phoneNum,
            controller: phoneNumberController,
          ),
          CustomTextField(
            type: TextInputType.emailAddress,
            labelText: StringConstants.mail,
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            StringConstants.confidentiality,
            color: Color(0xFF828796),
          )
        ],
      ),
    );
  }
}
