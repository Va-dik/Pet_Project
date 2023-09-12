import 'package:dio/dio.dart';
import 'package:hotels/domain/helpers/urls_helper.dart';
import 'package:hotels/domain/models/hotel/hotel_model.dart';
import 'package:retrofit/retrofit.dart';
part 'hotel_repository.g.dart';

@RestApi(baseUrl: UrlsHelper.baseUrl)
abstract class HotelRepository {
  factory HotelRepository(Dio dio) = _HotelRepository;

  @GET(UrlsHelper.hotels)
  Future<HotelModel> getHotel();
}
