// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls:
          (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

RoomList _$RoomListFromJson(Map<String, dynamic> json) => RoomList(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );