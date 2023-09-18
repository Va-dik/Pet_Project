import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:hotels/presentation/widgets/base_container.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class TourInfo extends StatelessWidget {
  const TourInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingModel bookingData =
        context.read<HotelBloc>().state.hotel!.bookingData!;
    List<List<String>> tableData = [
      [StringConstants.departure, bookingData.departure],
      [StringConstants.countryCity, bookingData.arrivalCountry],
      [
        StringConstants.dates,
        '${bookingData.tourDateStart}-${bookingData.tourDateStop}'
      ],
      [StringConstants.numberOfNights, '${bookingData.numberOfNights} ночей'],
      [StringConstants.hotel, bookingData.hotelName],
      [StringConstants.room, bookingData.room],
      [StringConstants.nutrition, bookingData.nutrition]
    ];
    return BaseContainer(
        child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Table(
        children: tableData.asMap().entries.map((entry) {
          final List<String> rowData = entry.value;
          return TableRow(
            children: rowData.asMap().entries.map((cellEntry) {
              final int colorIndex = cellEntry.key;
              final String cellData = cellEntry.value;
              Color textColor =
                  colorIndex % 2 == 0 ? const Color(0xFF828796) : Colors.black;

              return TableCell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomText(
                    cellData,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    ));
  }
}
