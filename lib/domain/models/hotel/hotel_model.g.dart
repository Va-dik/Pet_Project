// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      id: json['id'] as int,
      name: json['name'] as String,
      minimalPrice: json['minimal_price'],
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls:
          (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
      aboutTheHotel: json['about_the_hotel'] as Map<String, dynamic>,
      address: json['adress'] as String,
      priceForIt: json['price_for_it'] as String,
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );