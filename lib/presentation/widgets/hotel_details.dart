import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/rating.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Rating(),
        const SizedBox(height: 8),
        CustomText(
          context.read<HotelBloc>().state.hotel!.name,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: -1,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0x190D72FF),
            visualDensity: const VisualDensity(vertical: -3),
            padding: const EdgeInsets.only(right: 0),
          ),
          onPressed: () {},
          child: CustomText(
            context.read<HotelBloc>().state.hotel!.address,
            color: const Color.fromRGBO(13, 114, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: -0.4,
          ),
        )
      ],
    );
  }
}
