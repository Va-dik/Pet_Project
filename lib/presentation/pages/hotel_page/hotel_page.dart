import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/pages/hotel_page/hotel_body.dart';
import 'package:hotels/presentation/pages/hotel_page/hotel_header.dart';
import 'package:hotels/presentation/widgets/custom_app_bar.dart';
import 'package:hotels/presentation/widgets/action_button.dart';

// DEVELOPED BY VA-DIK, GitHub: [https://github.com/va-dik], tg: [https://t.me/it_vadik]

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: StringConstants.hotel),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelHeader(),
              SizedBox(height: 10),
              HotelBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ActionButton(
        textButton: StringConstants.toRoomSelectionButton,
        onPressed: () => Navigator.pushNamed(
          context,
          '/roomPage',
        ),
        isBottom: true,
      ),
    );
  }
}
