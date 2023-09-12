import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/data/api/repositories/booking_repository/booking_repository.dart';
import 'package:hotels/data/api/repositories/hotel_repository/hotel_repository.dart';
import 'package:hotels/data/api/repositories/room_repository/room_repository.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_event.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_state.dart';
import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:hotels/domain/models/hotel/hotel_model.dart';
import 'package:hotels/domain/models/room/room_model.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelState()) {
    on<GetHotelDataEvent>(_getHotelData);
    on<GetHotelRoomsDataEvent>(_getHotelRoomsData);
    on<GetBookingDataEvent>(_getBookingData);
  }

  final Dio dio = Dio();
  late HotelModel hotel;

  void _getHotelData(GetHotelDataEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(isLoading: true));

    final HotelRepository hotelRepository = HotelRepository(dio);

    hotel = await hotelRepository.getHotel();

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(hotel: hotel));
  }

  void _getHotelRoomsData(
      GetHotelRoomsDataEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(isLoading: true));

    final RoomRepository roomRepository = RoomRepository(dio);

    final RoomList roomList = await roomRepository.getRooms();

    await Future.delayed(const Duration(seconds: 1));

    hotel.rooms = roomList.rooms;

    emit(state.copyWith(hotel: hotel));
  }

  void _getBookingData(
      GetBookingDataEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(isLoading: true));

    final BookingRepository bookingRepository = BookingRepository(dio);

    final BookingModel bookingData = await bookingRepository.getBookingData();

    await Future.delayed(const Duration(seconds: 1));

    hotel.bookingData = bookingData;

    emit(state.copyWith(hotel: hotel, ));
  }
}
