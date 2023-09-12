import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/models/hotel/hotel_model.dart';
import 'package:hotels/domain/models/room/room_model.dart';
import 'package:hotels/presentation/widgets/header.dart';
import 'package:hotels/presentation/widgets/custom_app_bar.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HotelModel hotel = context.read<HotelBloc>().hotel;
    return Scaffold(
      appBar: CustomAppBar(title: hotel.name),
      body: ListView.builder(
        itemCount: hotel.rooms.length,
        itemBuilder: (context, index) {
          final RoomModel room = hotel.rooms[index];
          return Header(
            photos: room.imageUrls,
            name: room.name,
            minimalPrice: room.price,
            priceForIt: room.pricePer,
            peculiarities: room.peculiarities,
          );
        },
      ),
    );
  }
}
