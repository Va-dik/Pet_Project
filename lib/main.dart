import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_event.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_state.dart';
import 'package:hotels/presentation/pages/booking_page/booking_page.dart';
import 'package:hotels/presentation/pages/hotel_page/hotel_page.dart';
import 'package:hotels/presentation/pages/pay_success_page/pay_success_page.dart';
import 'package:hotels/presentation/pages/room_page/room_page.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocProvider<HotelBloc>(
      create: (context) => HotelBloc(),
      child: MaterialApp(
        title: 'Hotels',
        routes: {
          'hotelPage': (context) => const HotelPage(),
          '/roomPage': (context) => const RoomPage(),
          '/bookingPage': (context) => const BookingPage(),
          '/paySuccessPage': (context) => const PaySuccessPage(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(246, 246, 249, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: Scaffold(
          body: BlocBuilder<HotelBloc, HotelState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (!state.isLoading) {
                if (state.hotel != null) {
                  return const HotelPage();
                } else {
                  context.read<HotelBloc>().add(GetHotelDataEvent());
                  context.read<HotelBloc>().add(GetHotelRoomsDataEvent());
                  context.read<HotelBloc>().add(GetBookingDataEvent());
                  return const SizedBox();
                }
              } else if (state is ErrorHotelDataState) {
                return Center(
                  child: CustomText(
                    state.errorMessage,
                    fontSize: 20,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
