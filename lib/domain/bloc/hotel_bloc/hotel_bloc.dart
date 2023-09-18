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
  final Dio dio = Dio();
  late final HotelRepository hotelRepository;
  late final RoomRepository roomRepository;
  late final BookingRepository bookingRepository;

  HotelBloc() : super(HotelState()) {
    on<GetHotelDataEvent>(_getHotelData);
    on<GetHotelRoomsDataEvent>(_getHotelRoomsData);
    on<GetBookingDataEvent>(_getBookingData);
    
    hotelRepository = HotelRepository(dio);
    roomRepository = RoomRepository(dio);
    bookingRepository = BookingRepository(dio);
  }

  late HotelModel hotel;

  void _getHotelData(GetHotelDataEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(isLoading: true));

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

    emit(state.copyWith(
      hotel: hotel,
    ));
  }

  // Future<void> _onGetDataEvent(
  //   GetDataEvent event,
  //   Emitter emit,
  // ) async
  // {
  //   emit(state.copyWith(isLoading: true));

  //   final hotel = await hotelRepository.getHotel();
  //   hotel
  //     ..rooms = (await roomRepository.getRooms()).rooms
  //     ..bookingData = await bookingRepository.getBookingData();

  //   emit(state.copyWith(hotel: hotel));
  // }

  // Future<void> _getHotelData(GetHotelDataEvent event, Emitter<HotelState> emit) async
  // {
  //   emit(state.copyWith(isLoading: true));

  //   emit(state.copyWith(hotel: await hotelRepository.getHotel()));
  // }

  // Future<void> _getHotelRoomsData(
  //     GetHotelRoomsDataEvent event, Emitter<HotelState> emit,) async
  // {
  //   emit(state.copyWith(isLoading: true));

  //   final hotel = state.hotel;
  //   hotel?.rooms = (await roomRepository.getRooms()).rooms;

  //   emit(state.copyWith(hotel: hotel));
  // }

  // Future<void> _getBookingData(
  //     GetBookingDataEvent event, Emitter<HotelState> emit,) async
  // {
  //   emit(state.copyWith(isLoading: true));

  //   final hotel = state.hotel;
  //   hotel?.bookingData = await bookingRepository.getBookingData();

  //   emit(state.copyWith(hotel: hotel, ));
  // }
}
