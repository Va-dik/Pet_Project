import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:hotels/domain/models/room/room_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  final int id;
  final String name;
  final String address;
  final dynamic minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final Map<String, dynamic> aboutTheHotel;
  List<RoomModel> rooms;
  BookingModel? bookingData;

  HotelModel(
      {required this.id,
      required this.name,
      required this.minimalPrice,
      required this.rating,
      required this.ratingName,
      required this.imageUrls,
      required this.aboutTheHotel,
      required this.address,
      required this.priceForIt,
      this.rooms = const [],
      this.bookingData});

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);
}
