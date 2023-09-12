import 'package:json_annotation/json_annotation.dart';
part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
}
@JsonSerializable()
class RoomList {
  final List<RoomModel> rooms;

  RoomList({required this.rooms});

  factory RoomList.fromJson(Map<String, dynamic> json) =>
      _$RoomListFromJson(json);
}
