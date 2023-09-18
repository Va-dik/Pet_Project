import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:hotels/domain/models/room/room_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final HotelDescription? aboutTheHotel;
  List<RoomModel> rooms;
  BookingModel? bookingData;

  HotelModel({
    this.id = -1,
    this.name = "",
    this.minimalPrice = 0,
    this.rating = 0,
    this.ratingName = "",
    this.imageUrls = const [],
    this.aboutTheHotel,
    this.address = "",
    this.priceForIt = "",
    this.rooms = const [],
    this.bookingData,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);
}

@JsonSerializable()
class HotelDescription {
  final String description;
  final List<String> peculiarities;

  HotelDescription({
    this.description = '',
    this.peculiarities = const [],
  });

  factory HotelDescription.fromJson(Map<String, dynamic> json) =>
      _$HotelDescriptionFromJson(json);
}