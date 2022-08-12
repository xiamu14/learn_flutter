import 'package:animax/screens/home.dart';
import 'package:animax/screens/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  static String routePath = '/welcome';

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _pageController = PageController();
  late SharedPreferences sharedPref;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      sharedPref = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleNext(BuildContext context) {
    final signInfo = sharedPref.getString('signInfo');
    if (signInfo != null) {
      print(signInfo);
      GoRouter.of(context).push(Home.routePath);
    } else {
      GoRouter.of(context).push(Sign.routePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: sw,
              height: sh,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: const [
                  IntroCard(
                    title: 'Welcome to Animax',
                    introduction:
                        'The best streaming anime app of the century to entertain you every day',
                  ),
                  IntroCard(
                    title: 'Welcome to Animax',
                    introduction:
                        'The best streaming anime app of the century to entertain you every day',
                  ),
                  IntroCard(
                    title: 'Welcome to Animax',
                    introduction:
                        'The best streaming anime app of the century to entertain you every day',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: (sw - 360) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xff06c149),
                      dotHeight: 12,
                      dotWidth: 12,
                      radius: 12,
                      dotColor: Color(0xffe0e0e0),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      handleNext(context);
                    },
                    child: Container(
                      width: 360,
                      height: 58,
                      decoration: BoxDecoration(
                          color: const Color(0xff06c149),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroCard extends StatelessWidget {
  const IntroCard({
    Key? key,
    required this.title,
    required this.introduction,
  }) : super(key: key);

  final String title;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: sw,
          height: sh * 0.8,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(24, 26, 0, 0), Color(0xff181a20)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sh * 0.2),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  introduction,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
