import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  int id;
  String hotelName;
  String hotelAddress;
  int hoRating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  BookingModel({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.hoRating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
