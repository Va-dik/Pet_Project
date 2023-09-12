import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/pages/booking_page/booking_page.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/action_button.dart';
import 'package:hotels/presentation/widgets/hotel_details.dart';
import 'package:hotels/presentation/widgets/photo_carousel.dart';
import 'package:hotels/presentation/widgets/snippet.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.photos,
    required this.name,
    this.address,
    required this.minimalPrice,
    required this.priceForIt,
    this.peculiarities,
  });
  final List<String> photos;
  final String name;
  final String? address;
  final dynamic minimalPrice;
  final String priceForIt;
  final List<String>? peculiarities;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoCarousel(photos: photos),
          SizedBox(height: address == null ? 8 : 0),
          address == null
              ? CustomText(
                  name,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: -1,
                )
              : const SizedBox(),
          address == null
              ? const SizedBox(
                  height: 8,
                )
              : const SizedBox(),
          peculiarities != null
              ? Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      peculiarities!.map((e) => Snippet(text: e)).toList(),
                )
              : const HotelDetails(),
          address == null
              ? const SizedBox(
                  height: 4,
                )
              : const SizedBox(),
          address == null ? buildButton() : const SizedBox(),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            children: [
              CustomText(
                '${address != null ? 'от' : ''} $minimalPrice ₽ ',
                fontWeight: FontWeight.w600,
                fontSize: 30,
                letterSpacing: -1,
              ),
              CustomText(
                priceForIt,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 2.25,
                letterSpacing: -0.5,
                color: const Color.fromRGBO(130, 135, 150, 1),
              ),
            ],
          ),
          address == null
              ? const SizedBox(
                  height: 16,
                )
              : const SizedBox(),
          address == null
              ? ActionButton(
                  textButton: StringConstants.chooseRoomButton,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  TextButton buildButton() {
    return TextButton.icon(
      onPressed: () {},
      label: const Icon(
        Icons.arrow_forward_ios,
        size: 22,
      ),
      icon: const CustomText(
        StringConstants.detailRoom,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(13, 114, 255, 0.1),
          foregroundColor: const Color.fromRGBO(13, 114, 255, 1),
          iconColor: const Color.fromRGBO(13, 114, 255, 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          )),
    );
  }
}
