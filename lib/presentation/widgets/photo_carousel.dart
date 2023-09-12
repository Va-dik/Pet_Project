import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotels/domain/helpers/string_constants.dart';
import 'package:hotels/presentation/widgets/custom_text.dart';

class PhotoCarousel extends StatefulWidget {
  final List<String> photos;

  const PhotoCarousel({super.key, required this.photos});

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: height * 0.3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.photos.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: widget.photos[index],
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Center(
                        child: CustomText(
                          StringConstants.photoLoadingError,
                          fontSize: 15,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: _buildIndicator(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildIndicator() {
    final List<Widget> indicators = [];
    for (int i = 0; i < widget.photos.length; i++) {
      Color indicatorColor = _calculateIndicatorColor(i);
      indicators.add(
        Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indicatorColor,
          ),
        ),
      );
    }
    return indicators;
  }

  Color _calculateIndicatorColor(int index) {
    int difference = (_currentPage - index).abs();
    int maxDifference = 4;

    if (difference == 0) {
      return Colors.black;
    } else {
      int brightnessValue =
          (200 - (difference * (150 ~/ maxDifference))).clamp(0, 255);

      return Color.fromARGB(brightnessValue, 255 - brightnessValue,
          255 - brightnessValue, 255 - brightnessValue);
    }
  }
}
