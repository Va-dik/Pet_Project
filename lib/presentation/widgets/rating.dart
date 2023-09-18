import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = context.read<HotelBloc>().state.hotel;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromRGBO(255, 199, 0, 0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Color.fromRGBO(255, 168, 0, 1),
            size: 20,
          ),
          const SizedBox(
            width: 1,
          ),
          CustomText(
            '${hotel!.rating} ${hotel.ratingName}',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(255, 168, 0, 1),
          ),
        ],
      ),
    );
  }
}
