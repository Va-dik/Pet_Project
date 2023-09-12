import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hotels/domain/helpers/urls_helper.dart';
import 'package:hotels/domain/models/room/room_model.dart';
import 'package:retrofit/retrofit.dart';
part 'room_repository.g.dart';

@RestApi(baseUrl: UrlsHelper.baseUrl)
abstract class RoomRepository {
  factory RoomRepository(Dio dio) = _RoomRepository;

  @GET(UrlsHelper.rooms)
  Future<RoomList> getRooms();
}
