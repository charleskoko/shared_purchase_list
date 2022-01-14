import 'package:flutter/material.dart';
import 'package:shared_purchase_list/core/presentation/widgets/design_widgets/rounded_button.dart';
import 'package:shared_purchase_list/core/shared/colors.dart';
import 'package:shared_purchase_list/on_boarding/domain/on_boarding_element.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _totalPage = 3;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < _totalPage; i++) {
      list.add(_indicator(i == _currentPage));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: isActive ? kRedColor : kPurpilColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: getOnBoardingelements()
                  .map((element) => renderPageElement(element))
                  .toList(),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(48),
              child: SizedBox(
                  height: 48,
                  child: _currentPage != _totalPage - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.goNamed('login');
                              },
                              child: const Text('Skip'),
                            ),
                            Row(
                              children: _buildPageIndicator(),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: const Text('Next'),
                            )
                          ],
                        )
                      : RoundedButton(
                          label: 'Commencer',
                          onPress: () {
                            context.goNamed('login');
                          },
                        ))),
        ],
      ),
    );
  }

  Widget renderPageElement(OnBoardingElement page) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              page.imageUrl,
              height: 250,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          Center(
            child: Text(
              page.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 1,
              width: 100,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
