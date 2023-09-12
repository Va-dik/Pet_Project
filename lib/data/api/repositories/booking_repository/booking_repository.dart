import 'package:dio/dio.dart';
import 'package:hotels/domain/helpers/urls_helper.dart';
import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:retrofit/retrofit.dart';
part 'booking_repository.g.dart';

@RestApi(baseUrl: UrlsHelper.baseUrl)
abstract class BookingRepository {
  factory BookingRepository(Dio dio) = _BookingRepository;

@GET(UrlsHelper.booking)
Future<BookingModel> getBookingData();
} 
