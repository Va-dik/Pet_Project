import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/domain/models/tourist/tourist_model.dart';
import 'package:hotels/presentation/widgets/base_container.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/custom_text_field.dart';

class TouristTile extends StatefulWidget {
  const TouristTile({super.key, required this.tourists, required this.formKey, required this.fieldColor});
  final List<TouristModel> tourists;
  final GlobalKey<FormState> formKey;
  final Color fieldColor;

  @override
  State<TouristTile> createState() => _TouristTileState();
}

class _TouristTileState extends State<TouristTile> {
  bool isExpanded = false;

  final List<String> labels = [
    StringConstants.name,
    StringConstants.lastName,
    StringConstants.dateOfBirth,
    StringConstants.citizenship,
    StringConstants.passportNumber,
    StringConstants.validityPeriodPassport
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.tourists.asMap().entries.map((entry) {
          final index = entry.key;
          final tourist = entry.value;

          return BaseContainer(
            child: ExpansionTile(
              tilePadding: const EdgeInsets.only(right: 0),
              iconColor: Colors.black,
              onExpansionChanged: (value) => setState(() {
                isExpanded = value;
              }),
              textColor: Colors.black,
              shape: const RoundedRectangleBorder(side: BorderSide.none),
              title: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomText(
                  '${StringConstants.tourist} ${index + 1}',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(5),
                decoration: const ShapeDecoration(
                  color: Color(0x190D72FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color.fromRGBO(13, 114, 255, 1),
                ),
              ),
              children: [
                for (int i = 0; i < tourist.props.length; i++)
                  CustomTextField(
                    controller: tourist.props[i],
                    labelText: labels[i],
                    fieldColor: tourist.props[i].text.isEmpty ? widget.fieldColor : const Color(0xFFF6F6F9),
                  )
              ],
            ),
          );
        }).toList(),
        BaseContainer(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  StringConstants.addTourist,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.tourists.add(TouristModel());
                    });
                  },
                  icon: Container(
                    height: 32,
                    width: 32,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF0D72FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
