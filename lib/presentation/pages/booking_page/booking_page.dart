import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/domain/models/tourist/tourist_model.dart';
import 'package:hotels/presentation/pages/booking_page/components/tour_price.dart';
import 'package:hotels/presentation/widgets/action_button.dart';
import 'package:hotels/presentation/widgets/base_container.dart';
import 'package:hotels/presentation/widgets/custom_app_bar.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/hotel_details.dart';

import 'components/buyer_information.dart';
import 'components/tour_info.dart';
import 'components/tourist_tile.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<TouristModel> tourists = [TouristModel()];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Color fieldColor = const Color(0xFFF6F6F9);

  bool _areAllFieldsFilled() {
    for (int i = 0; i < tourists.map((e) => e.props).length; i++) {
      for (var controller in tourists[i].props) {
        if (controller.text.isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  void _submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (_areAllFieldsFilled()) {
        // All fields are filled, navigate to the next page.
        Navigator.of(context).pushNamed('/paySuccessPage');
      } else {
        // Not all fields are filled, show an error message or update field colors.
        // For simplicity, we'll just update field colors to red.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const CustomText(
              'Ошибка',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            content: const CustomText(
              'Заполните все поля для продолжения',
              fontSize: 16,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const CustomText('Ок'),
              )
            ],
          ),
        ).then((value) => setState(() {
              fieldColor = const Color(0x00eb5757).withOpacity(0.15);
            }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingData = context.read<HotelBloc>().hotel.bookingData!;
    int totalPrice = bookingData.tourPrice +
        bookingData.fuelCharge +
        bookingData.serviceCharge;
    return Scaffold(
      appBar: const CustomAppBar(title: StringConstants.booking),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseContainer(child: HotelDetails()),
              const TourInfo(),
              BuyerInformation(),
              Form(
                key: formKey,
                child: TouristTile(
                  fieldColor: fieldColor,
                  tourists: tourists,
                  formKey: formKey,
                ),
              ),
              TourPrice(
                tourPrice: bookingData.tourPrice,
                fuelCharge: bookingData.fuelCharge,
                serviceCharge: bookingData.serviceCharge,
                totalPrice: totalPrice,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ActionButton(
        textButton: '${StringConstants.payButton} $totalPrice ₽',
        onPressed: () => _submitForm(context),
        isBottom: true,
      ),
    );
  }
}
