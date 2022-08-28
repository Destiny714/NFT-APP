import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utils/extend.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.images,
    required this.width,
    required this.height,
    this.autoPlay = false,
    this.fit = BoxFit.fitWidth,
  }) : super(key: key);
  final List<ImageProvider> images;
  final double width;
  final double height;
  final BoxFit fit;
  final bool autoPlay;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.images
              .map((e) => Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        image: DecorationImage(image: e, fit: widget.fit),
                        color: Colors.blueAccent),
                  ))
              .toList(),
          options: CarouselOptions(
              clipBehavior: Clip.hardEdge,
              height: widget.height,
              viewportFraction: 1,
              autoPlay: widget.autoPlay,
              onPageChanged: (index, reason) {
                setState(() => currentPage = index);
              }),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(flex: 5),
            ...widget.images
                .map(
                  (e) => Container(
                    width: 1.5.w,
                    height: 1.5.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.images.indexOf(e) == currentPage
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ).pd(1.w),
                )
                .toList(),
            const Spacer(flex: 5),
          ],
        ).pd(null, padding: EdgeInsets.only(top: widget.height * 0.9)),
        // Padding(
        //   padding: EdgeInsets.only(top: 1.h),
        //   child: SizedBox(
        //     height: 0.4.h,
        //     width: 30.w,
        //     child: LinearProgressIndicator(
        //       value: (currentPage + 1) / widget.images.length,
        //       backgroundColor: Colors.grey,
        //       valueColor: const AlwaysStoppedAnimation(Colors.black),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
