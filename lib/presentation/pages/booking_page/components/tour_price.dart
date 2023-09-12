import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/domain/models/booking/booking_model.dart';
import 'package:hotels/presentation/widgets/base_container.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class TourPrice extends StatelessWidget {
  const TourPrice({super.key, required this.tourPrice, required this.fuelCharge, required this.serviceCharge, required this.totalPrice});
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    List<List<String>> tableData = [
      [StringConstants.tour, '$tourPrice ₽'],
      [StringConstants.fuelPrice, '$fuelCharge ₽'],
      [StringConstants.servicePrice, '$serviceCharge ₽'],
      [StringConstants.toPay, '$totalPrice ₽'],
    ];

    final double width = MediaQuery.of(context).size.width;
    return BaseContainer(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(width * 0.73),
        children: tableData.asMap().entries.map((entry) {
          final List<String> rowData = entry.value;
          return TableRow(
            children: rowData.asMap().entries.map((cellEntry) {
              final int colorIndex = cellEntry.key;
              final String cellData = cellEntry.value;

              Color textColor = colorIndex % 2 == 0
                  ? const Color(0xFF828796)
                  : cellData.contains(RegExp(totalPrice.toString()))
                      ? const Color(0xFF0D72FF)
                      : Colors.black;

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
