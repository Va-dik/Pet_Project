import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/models/hotel/hotel_model.dart';
import 'package:hotels/presentation/widgets/header.dart';

class HotelHeader extends StatelessWidget {
  const HotelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HotelModel hotel = context.read<HotelBloc>().hotel;
    return Header(
      photos: hotel.imageUrls,
      name: hotel.name,
      minimalPrice: hotel.minimalPrice,
      priceForIt: hotel.priceForIt,
      address: hotel.address,
    );
  }
}
