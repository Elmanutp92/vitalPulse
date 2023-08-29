import 'package:flutter/material.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';
import 'package:vital_pulse/widgets/widgets_recomendations/recomendation1.dart';
import 'package:vital_pulse/widgets/widgets_recomendations/recomendation2.dart';
import 'package:vital_pulse/widgets/widgets_recomendations/recomendation3.dart';
import 'package:vital_pulse/widgets/widgets_recomendations/recomendation4.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final List<Widget> recommendations = [
    const Recomendation1(),
    const Recomendation2(),
    const Recomendation3(),
    const Recomendation4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecommendationCarousel(recommendations),
    );
  }
}

class RecommendationCarousel extends StatefulWidget {
  final List<Widget> recommendations;

  const RecommendationCarousel(this.recommendations, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecommendationCarouselState createState() => _RecommendationCarouselState();
}

class _RecommendationCarouselState extends State<RecommendationCarousel> {
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
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    //double dw = responsive.width;
    double dh = responsive.height;
    //double dg = responsive.diagonal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.recommendations.length,
            itemBuilder: (BuildContext context, int index) {
              return RecommendationCard(widget.recommendations[index]);
            },
          ),
        ),
        SizedBox(height: dh * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.recommendations.length,
            (index) => _buildPageIndicator(index),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(int pageIndex) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    //double dg = responsive.diagonal;
    return Container(
      margin: EdgeInsets.only(
          right: dw * 0.01, left: dw * 0.01, top: dh * 0.01, bottom: dh * 0.03),
      width: pageIndex == _currentPage ? dw * 0.04 : dw * 0.04,
      height: pageIndex == _currentPage ? dh * 0.015 : dh * 0.015,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: pageIndex == _currentPage ? azulTuquesa : Colors.white,
        border: Border.all(
          color: azulTuquesa,
          width: 1,
        ),
        //borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final Widget recommendation;

  const RecommendationCard(this.recommendation, {super.key});

  @override
  Widget build(BuildContext context) {
    return recommendation;
  }
}
