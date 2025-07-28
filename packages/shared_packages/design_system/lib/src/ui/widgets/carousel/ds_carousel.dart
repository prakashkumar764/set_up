import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/widgets/carousel/ds_carousel_indicator.dart';
import 'package:flutter/material.dart';

class DSCarousel extends StatefulWidget {
  final List<Widget> slidesList;
  final bool isAutoPlay;
  final double height;
  final Color? indicatorBackgroundColor;

  const DSCarousel({
    required this.slidesList,
    this.height = 200,
    this.isAutoPlay = true,
    this.indicatorBackgroundColor,
    super.key,
  });

  @override
  State<DSCarousel> createState() => _DSCarouselState();
}

class _DSCarouselState<T> extends State<DSCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1.0,
            autoPlay: widget.isAutoPlay,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              if (mounted) {
                setState(() => selectedIndex = index);
              }
            },
          ),
          items: widget.slidesList,
        ),
        if (widget.slidesList.length > 1)
          Positioned(
            bottom: context.dsSpacing.sp300,
            child: DSCarouselIndicator(
              slidesList: widget.slidesList,
              selectedIndex: selectedIndex,
              backgroundColor: widget.indicatorBackgroundColor,
            ),
          ),
      ],
    );
  }
}
