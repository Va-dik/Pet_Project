import 'package:hotels/domain/models/hotel/hotel_model.dart';

class HotelState {
   HotelModel? hotel;
  final bool isLoading;

  HotelState({
    this.hotel,
    this.isLoading = false,
  });

  HotelState copyWith({
    HotelModel? hotel,
    bool isLoading = false,
  }) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      isLoading: isLoading,
    );
  }
}

class ErrorHotelDataState extends HotelState {
  final String errorMessage;

  ErrorHotelDataState({required this.errorMessage});
}
