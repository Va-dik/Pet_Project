// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? "",
      minimalPrice: json['minimal_price'] as int? ?? 0,
      rating: json['rating'] as int? ?? 0,
      ratingName: json['rating_name'] as String? ?? "",
      imageUrls: (json['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      aboutTheHotel: HotelDescription.fromJson(
          json['about_the_hotel'] as Map<String, dynamic>),
      address: json['adress'] as String? ?? "",
      priceForIt: json['price_for_it'] as String? ?? "",
    );

HotelDescription _$HotelDescriptionFromJson(Map<String, dynamic> json) =>
    HotelDescription(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );