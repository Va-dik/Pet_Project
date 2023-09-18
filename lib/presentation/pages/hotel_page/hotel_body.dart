import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/domain/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/domain/helpers/assets_icons.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';
import 'package:hotels/presentation/widgets/snippet.dart';

class HotelBody extends StatelessWidget {
  const HotelBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            StringConstants.aboutHotel,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: context
                    .read<HotelBloc>().state
                    .hotel!
                    .aboutTheHotel!.peculiarities
                .map((element) => Snippet(text: element))
                .toList(),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            context.read<HotelBloc>().state.hotel!.aboutTheHotel!.description,
            fontSize: 16,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(height: 16.0),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFBFBFC),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Column(
                children: <Widget>[
                  buildListTile(
                    title: StringConstants.facilities,
                    imagePath: AssetsIcons.smileIcon,
                  ),
                  buildDivider(width),
                  buildListTile(
                    imagePath: AssetsIcons.doneIcon,
                    title: StringConstants.included,
                  ),
                  buildDivider(width),
                  buildListTile(
                    imagePath: AssetsIcons.underdoneIcon,
                    title: StringConstants.notIncluded,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({required String title, required String imagePath}) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      contentPadding: const EdgeInsets.only(right: 10),
      title: CustomText(
        title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle: const CustomText(StringConstants.mostNecessary),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: Image.asset(
          imagePath,
          scale: 20,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(44, 48, 53, 1),
      ),
      onTap: () {},
      dense: true,
      splashColor: Colors.amber,
    );
  }
}

Divider buildDivider(double width) {
  return Divider(
    height: 1,
    indent: width * 0.135,
    endIndent: width * 0.03,
  );
}
